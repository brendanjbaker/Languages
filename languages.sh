#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$(dirname -- "${BASH_SOURCE[0]}")/lib/library.bash"

declare program_name="languages.sh"
declare version="0.0.0.0"

declare arguments=("$@")
declare slot="0"

declare option_all="false"
declare option_debug="false"
declare option_debug_docker="false"
declare option_debug_program="false"
declare option_debug_setup="false"
declare option_interactive="false"
declare option_parallel="false"
declare option_prime="false"
declare option_reverse="false"
declare option_test="false"

declare initialized="false"
declare root_directory
declare root_directory_native
declare language_properties_filename="language.properties"
declare program_properties_filename="program.properties"
declare system_hash

root_directory=$(program::get_script_directory)
root_directory_native=$(path::convert --mixed "$root_directory")
base_hash=$(directory::hash "$root_directory/docker/base")
base_hash=$(string::hash --length 16 "$base_hash")
system_hash=$(directory::hash "$root_directory/docker/system")
system_hash=$(string::hash --length 16 "${base_hash}${system_hash}")

function clean {
	local pattern='localhost/languages(-.+)?'
	local containers
	local images

	start_docker_if_necessary

	set -x

	rm -fr "$root_directory/cache"
	rm -f "/tmp/languages-image-list"

	containers=$( \
		podman container list --all --external --noheading \
		| ( grep -E "$pattern" || true ) \
		| awk '{ print $1 }')

	if [[ -n "$containers" ]]; then
		echo "$containers" | xargs -n 10 --verbose -- podman container rm --force --volumes
	fi

	images=$( \
		podman image list --noheading \
		| ( grep -E "$pattern" || true ) \
		| awk '{ print $1 ":" $2 }')

	if [[ -n "$images" ]]; then
		echo "$images" | xargs -n 100 --verbose -- podman image rm --force --ignore
	fi

	podman builder prune --force --external
	podman volume prune --force

	podman machine ssh <<- EOF
		sudo fstrim -av
		EOF

	podman system prune --force

	if platform::is_windows_or_wsl; then
		local vhdx_path_windows
		local vhdx_path="$HOME/.local/share/containers/podman/machine/wsl/wsldist/podman-machine-default/ext4.vhdx"

		if [[ -f "$vhdx_path" ]]; then
			vhdx_path_windows=$(path::convert -w "$vhdx_path")

			podman machine stop
			wsl --shutdown

			sudo diskpart.exe <<- EOF
				SELECT VDISK FILE="$vhdx_path_windows"
				ATTACH VDISK READONLY
				COMPACT VDISK
				DETACH VDISK
				EOF
		fi
	fi
}

function cache_image_list {
	if [[ "$option_all" == "false" ]]; then
		return
	fi

	podman image list --format '{{.Repository}}:{{.Tag}}' \
	| (grep -v '<none>' || true) \
	| (grep '^localhost/' || true) \
	| sed 's/^localhost\///g' > "/tmp/languages-image-list"
}

function colorize {
	if [[ "$option_test" == "false" ]]; then
		cat
	else
		local search_1='^ok'
		local search_2='^not ok'
		local search_3='^\(.*\) \([0-9]\+\) \(.*[0-9]\+ms\)$'
		local search_4='in \([0-9]\+\)ms$'
		local search_5='^\([0-9]\+\)\.\.\([0-9]\+\)$'

		local replace_1="${COLOR_GREEN}ok${COLOR_RESET}"
		local replace_2="${COLOR_RED}not ok${COLOR_RESET}"
		local replace_3="${COLOR_WHITE}${UNDERLINE_BEGIN}\\2${COLOR_RESET} \\1 \\3"
		local replace_4="${COLOR_GRAY}in \\1ms${COLOR_RESET}"
		local replace_5="${COLOR_GRAY}\\1..\\2${COLOR_RESET}"

		sed \
			--expression="s/$search_1/$replace_1/g" \
			--expression="s/$search_2/$replace_2/g" \
			--expression="s/$search_3/$replace_3/g" \
			--expression="s/$search_4/$replace_4/g" \
			--expression="s/$search_5/$replace_5/g" \
			--unbuffered
	fi
}

function image_exists {
	local name="$1"

	if [[ ! -f "/tmp/languages-image-list" ]]; then
		docker::image_exists "$1"
	elif grep "^$name\$" > /dev/null < "/tmp/languages-image-list"; then
		return "$STATUS_TRUE"
	else
		docker::image_exists "$1"
	fi
}

function initialize {
	if [[ "$initialized" == "true" ]]; then
		return
	fi

	if ! is_parallel_worker; then
		start_docker_if_necessary
		cache_image_list
		stop_running_containers

		if [[ ! -d "$root_directory/cache" ]]; then
			mkdir -p "$root_directory/cache"
		fi
	fi

	initialized="true"
}

function is_parallel_worker {
	if [[ "$slot" == "0" ]]; then
		return "$STATUS_FALSE"
	else
		return "$STATUS_TRUE"
	fi
}

function language_exists {
	language="$1"

	if [[ -d "$root_directory/src/$language" ]]; then
		return "$STATUS_TRUE"
	else
		return "$STATUS_FALSE"
	fi
}

function list {
	local -A program_counts=()

	for language in $(list_languages); do
		printf '%s\n' "${COLOR_WHITE}${UNDERLINE_BEGIN}$language${COLOR_RESET}"

		for program in $(list_programs "$language"); do
			(( program_counts[$program] = ${program_counts[$program]:-0} + 1 ))

			printf '  %s\n' "${COLOR_RESET}$program${COLOR_RESET}"
		done
		printf '\n'
	done

	echo "${COLOR_GRAY}Counts...${COLOR_RESET}"
	echo

	for program in $(printf '%s\n' "${!program_counts[@]}" | sort); do
		echo "$program: ${UNDERLINE_BEGIN}${program_counts[$program]}${COLOR_RESET}"
	done
}

function list_languages {
	local languages

	languages=$(directory::list_subdirectories --exclude-hidden "$root_directory")

	if [[ "$option_reverse" == "true" ]]; then
		languages=$(echo "$languages" | sort --reverse)
	fi

	for language in $languages; do
		if [[ -f "$root_directory/src/$language/.skip" ]]; then
			continue
		fi

		echo "$language"
	done
}

function list_pairs {
	for language in $(list_languages); do
		for program in $(list_programs "$language"); do
			printf '%s %s\n' "$language" "$program"
		done
	done
}

function list_programs {
	local language="${1:?}"
	local programs

	programs=$(directory::list_subdirectories --exclude-hidden "$root_directory/src/$language")

	if [[ "$option_reverse" == "true" ]]; then
		programs=$(echo "$programs" | sort --reverse)
	fi

	for program in $programs; do
		if [[ -f "$root_directory/src/$language/$program/.skip" ]]; then
			continue
		fi

		echo "$program"
	done
}

function main {
	function usage_error {
		error::usage $'\n'"$(print_usage)"
	}

	while true; do
		if [[ $# -ge 1 && "$1" == "--debug" ]]; then
			option_debug="true"
			option_debug_docker="true"
			option_debug_program="true"
			option_debug_setup="true"
			shift
		elif [[ $# -ge 1 && "$1" == "--debug-docker" ]]; then
			option_debug_docker="true"; shift
		elif [[ $# -ge 1 && "$1" == "--debug-program" ]]; then
			option_debug_program="true"; shift
		elif [[ $# -ge 1 && "$1" == "--debug-setup" ]]; then
			option_debug_setup="true"; shift
		elif [[ $# -ge 1 && "$1" == "--interactive" ]]; then
			option_interactive="true"; shift
		elif [[ $# -ge 1 && "$1" == "--parallel" ]]; then
			option_parallel="true"; shift
		elif [[ $# -ge 1 && "$1" == "--prime" ]]; then
			option_prime="true"; shift
		elif [[ $# -ge 1 && "$1" == "--reverse" ]]; then
			option_reverse="true"; shift
		elif [[ $# -ge 1 && "$1" == "--slot" ]]; then
			slot="$2"; shift; shift
		elif [[ $# -ge 1 && "$1" == "--test" ]]; then
			option_test="true"; shift
		else
			break
		fi
	done

	if [[ $# -eq 1 && "$1" == "--help" ]]; then
		print_help
	elif [[ $# -eq 1 && "$1" == "clean" ]]; then
		clean
	elif [[ $# -eq 1 && "$1" == "list" ]]; then
		list
	elif [[ $# -eq 1 && "$1" == "prime" ]]; then
		prime
	elif [[ $# -eq 1 && "$1" == "run" ]]; then
		run_all "${@:2}"
	elif [[ $# -eq 2 && "$1" == "run" ]]; then
		run_language "${@:2}"
	elif [[ $# -eq 3 && "$1" == "run" ]]; then
		run_program "${@:2}"
	else
		usage_error
	fi
}

function print_banner {
	if [[ $# -ne 3 ]]; then
		error::usage "print_banner <language-name> <language-version> <program-name>"
	fi

	local language_name="$1"
	local language_version="$2"
	local program_name="$3"
	local banner=""

	banner=""
	banner="${banner}Language ${COLOR_WHITE}${UNDERLINE_BEGIN}$language_name${COLOR_RESET}"

	if [[ -n "$language_version" && "$language_version" != "?" ]]; then
		banner="${banner}${COLOR_GRAY} ($language_version)${COLOR_RESET}"
	fi

	banner="${banner}, program ${COLOR_WHITE}${UNDERLINE_BEGIN}$program_name${COLOR_RESET}${COLOR_GRAY}...${COLOR_RESET}"

	echo "$banner"
}

function print_help {
	echo "$program_name $version"
	echo
	echo "Usage:"

	print_usage
}

function print_usage {
	cat <<- EOF
		  $program_name [options] <command>

		Options:
		  --debug           Debug everything.
		  --debug-docker    Debug docker building, etc.
		  --debug-program   Debug program execution.
		  --debug-setup     Debug language setup script.
		  --help            Show this help message.
		  --interactive     Begin an interaction session.
		  --parallel        Runs multiple programs concurrently.
		  --prime           Pre-generates image(s) without running them.
		  --reverse         Runs programs in reverse order.
		  --test            Run unit tests.
		  --version         Show version information.

		Commands:
		  clean                      Remove stored images and containers.
		  list                       List languages and their programs.
		  run                        Run all languages and programs.
		  run <LANGUAGE>             Run all programs for a language.
		  run <LANGUAGE> <PROGRAM>   Run a specific language's program.

		EOF
}

function program_exists {
	language="$1"
	program="$2"

	if [[ -d "$root_directory/src/$language/$program" ]]; then
		return "$STATUS_TRUE"
	else
		return "$STATUS_FALSE"
	fi
}

function run {
	if [[ $# -ne 2 ]]; then
		error::usage "run <language> <program>"
	fi

	local language="$1"
	local program="$2"
	local -a build_quiet_argument=("--quiet")
	local stdout="/dev/fd/1"
	local setup_stdout="/dev/fd/1"
	local language_hash
	local program_hash
	local tests_hash

	local -a environment_options=(
		"--env" "DEBUG=$option_debug"
		"--env" "DEBUG_DOCKER=$option_debug_docker"
		"--env" "DEBUG_PROGRAM=$option_debug_program"
		"--env" "DEBUG_SETUP=$option_debug_setup"
		"--env" "LANGUAGE=$language"
		"--env" "PROGRAM=$program"
		"--env" "TEST=$option_test")

	language_hash=$(directory::hash "$root_directory/src/$language/.language")
	program_hash=$(directory::hash "$root_directory/src/$language/$program")
	tests_hash=$(directory::hash "$root_directory/tests")

	language_hash=$(string::hash --length 16 "${base_hash}${system_hash}${language_hash}")
	program_hash=$(string::hash --length 16 "${base_hash}${system_hash}${language_hash}${program_hash}${tests_hash}")

	if [[ "$option_debug_docker" == "false" ]]; then
		stdout="/dev/null"
	else
		build_quiet_argument=()
	fi

	if [[ "$option_debug_setup" == "false" ]]; then
		setup_stdout="/dev/null"
	fi

	function build_base_image {
		if image_exists "languages-base:$base_hash"; then
			return
		fi

		podman build \
			--file "$root_directory_native/docker/base/base.dockerfile" \
			--tag "languages-base:intermediate" \
			"${build_quiet_argument[@]}" \
			"$root_directory_native" > "$stdout"

		container_id=$( \
			podman run \
				--detach \
				--privileged \
				--systemd=always \
				"languages-base:intermediate")

		podman exec \
			"${environment_options[@]}" \
			"$container_id" \
			/usr/bin/bash /setup/base/setup-post.sh > "$stdout" 2>&1

		podman stop "$container_id" > "$stdout"
		podman commit "$container_id" "languages-base:latest" > "$stdout" 2>&1
		podman commit "$container_id" "languages-base:$base_hash" > "$stdout" 2>&1
		podman container rm "$container_id" > "$stdout"
	}

	function build_system_image {
		if image_exists "languages-system:$system_hash"; then
			return
		fi

		podman build \
			--file "$root_directory_native/docker/system/system.dockerfile" \
			--tag "languages-system:latest" \
			--tag "languages-system:$system_hash" \
			"${build_quiet_argument[@]}" \
			"$root_directory_native" > "$stdout"
	}

	function build_language_image {
		if image_exists "languages-$language:$language_hash"; then
			return
		fi

		podman build \
			--build-arg LANGUAGE="$language" \
			--file "$root_directory_native/docker/language/language.dockerfile" \
			--tag "languages-$language:latest" \
			"${build_quiet_argument[@]}" \
			"$root_directory_native" > "$stdout"

		container_id=$( \
			podman run \
				--detach \
				--mount "type=bind,source=$root_directory/cache,target=/cache" \
				--privileged \
				--systemd=always \
				"languages-$language")

		podman exec \
			"${environment_options[@]}" \
			"$container_id" \
			/usr/bin/bash /setup/language/setup-post.sh > "$setup_stdout" 2>&1

		podman stop "$container_id" > "$stdout"
		podman commit "$container_id" "languages-$language:latest" > "$stdout" 2>&1
		podman commit "$container_id" "languages-$language:$language_hash" > "$stdout" 2>&1
		podman container rm "$container_id" > "$stdout"
	}

	function build_program_image {
		if image_exists "languages-$language-$program:$program_hash"; then
			return
		fi

		podman build \
			--build-arg LANGUAGE="$language" \
			--build-arg PROGRAM="$program" \
			--file "$root_directory_native/docker/program/program.dockerfile" \
			--tag "languages-$language-$program:latest" \
			--tag "languages-$language-$program:$program_hash" \
			"${build_quiet_argument[@]}" \
			"$root_directory_native" > "$stdout"
	}

	function execute {
		local result

		container_id=$( \
			podman run \
				--detach \
				--privileged \
				--rm \
				--systemd=always \
				"languages-$language-$program:$program_hash")

		local -a arguments=()

		arguments+=("${environment_options[@]}")

		if [[ "$option_interactive" == "true" ]]; then
			arguments+=("--interactive")
			arguments+=("--tty")
			arguments+=("$container_id")
			arguments+=("/usr/bin/bash")
		else
			arguments+=("$container_id")
			arguments+=("/usr/bin/bash" "/entrypoint.sh")

			# shellcheck disable=SC1090
			source "$root_directory/program/$program/configuration.sh"
		fi

		podman exec "${arguments[@]}" 2>&1 && result=$? || result=$?

		if [[ "$result" -ne 0 ]]; then
			if [[ "$option_interactive" == "false" ]]; then
				echo
				echo "${COLOR_RED}Failure.${COLOR_RESET}"
			fi
		fi

		podman container stop "$container_id" > "$stdout"
	}

	initialize

	if [[ "$option_debug" == "true" ]]; then
		set -x
	fi

	build_base_image
	build_system_image
	build_language_image
	build_program_image

	if [[ "$option_prime" == "true" ]]; then
		echo "Primed."
	else
		execute
	fi
}

function run_all {
	if [[ $# -ne 0 ]]; then
		error::usage "run_all"
	fi

	option_all="true"
	initialize

	if [[ "$option_parallel" == "true" ]]; then
		run_all_parallel
	else
		run_all_sequential
	fi
}

function run_all_parallel {
	# Options are all arguments except the last, e.g. "run" (command).
	local options
	local pairs
	local concurrency

	options=("${arguments[@]:0:${#arguments[@]}-1}")
	pairs=$(list_pairs)
	concurrency=$(nproc)

	parallel \
		--colsep "$CHARACTER_SPACE" \
		--jobs "$concurrency" \
		--keep-order \
		--will-cite \
		"$root_directory/languages.sh" "${options[@]}" --slot '{%}' run '{1}' '{2}' <<< "$pairs"
}

function run_all_sequential {
	for language in $(list_languages); do
		run_language "$language"
	done
}

function run_language {
	if [[ $# -ne 1 ]]; then
		error::usage "run_language <language>"
	fi

	local language="$1"

	if ! language_exists "$language"; then
		error "Language \"$language\" not found."
	fi

	for program in $(list_programs "$language"); do
		run_program "$language" "$program"
	done
}

# shellcheck disable=SC1090
function run_program {
	if [[ $# -ne 2 ]]; then
		error::usage "run_program <language> <program>"
	fi

	local language="$1"
	local program="$2"

	if ! language_exists "$language"; then
		error "Language \"$language\" not found."
	fi

	if ! program_exists "$language" "$program"; then
		error "Program \"$program\" for language \"$language\" not found."
	fi

	local language_properties_path
	local program_properties_path

	language_properties_path="$root_directory/src/$language/.language/$language_properties_filename"
	program_properties_default_path="$root_directory/program/$program/$program_properties_filename"
	program_properties_override_path="$root_directory/src/$language/$program/$program_properties_filename"

	if [[ -f "$program_properties_override_path" ]]; then
		program_properties_path="$program_properties_override_path"
	elif [[ -f "$program_properties_default_path" ]]; then
		program_properties_path="$program_properties_default_path"
	else
		error "Missing \"$program_properties_filename\" file in \"src/$language/$program\" directory."
	fi

	if [[ ! -f "$language_properties_path" ]]; then
		error "Missing \"$language_properties_filename\" file in \"src/$language\" directory."
	fi

	unset language_name
	unset language_version
	unset program_name

	source "$language_properties_path"
	source "$program_properties_path"

	if [[ ! -v language_name ]]; then
		error "Missing \"language_name\" property for language \"$language\"."
	elif [[ ! -v language_version ]]; then
		error "Missing \"language_version\" property for language \"$language\"."
	elif [[ ! -v program_name ]]; then
		error "Missing \"program_name\" property for language \"$language\", program \"$program\"."
	fi

	if [[ "$option_interactive" == "true" ]]; then
		run "$@"
		exit 0
	else
		print_banner "$language_name" "${language_version:-?}" "$program_name"

		echo
		run "$@" | colorize | indent
		echo
	fi
}

function start_docker_if_necessary {
	if docker::is_started; then
		return
	fi

	status::temporary "Starting Docker..."
	docker::start
	status::temporary --clear
}

function stop_running_containers {
	local running_containers

	running_containers=$(podman ps --all --format '{{.Names}}' | grep '^languages' || true)

	for container_name in $running_containers; do
		podman container rm --force "$container_name" > /dev/null
	done
}

main "$@"
