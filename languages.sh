#!/usr/bin/env bash

source library

declare program_name="languages.sh"
declare version="0.0.0.0"

declare option_debug="false"
declare option_debug_docker="false"
declare option_debug_program="false"
declare option_debug_setup="false"
declare option_interactive="false"
declare option_prime="false"

declare base_directory
declare base_directory_native
declare language_properties_filename="language.properties"
declare program_properties_filename="program.properties"
declare system_hash

base_directory=$(program::get_script_directory)
base_directory_native=$(path::convert --mixed "$base_directory")
system_hash=$(directory::hash "$base_directory/.docker")
system_hash=$(string::hash --length 16 "$system_hash")

function clean {
	local pattern='localhost/languages(-.+)?'
	local containers
	local images

	images=$( \
		podman image list --noheading \
		| ( grep -E "$pattern" || true ) \
		| awk '{ print $1 ":" $2 }')

	containers=$( \
		podman container list --noheading \
		| ( grep -E "$pattern" || true ) \
		| awk '{ print $1 }')

	for image in $images; do
		podman image rm "$image"
	done

	for container in $containers; do
		podman container stop "$container"
		podman container rm "$container"
	done

	podman builder prune --force
	podman volume prune --force
}

function list {
	for language in $(list_languages); do
		printf '%s\n' "${COLOR_WHITE}${UNDERLINE_BEGIN}$language${COLOR_RESET}"

		for program in $(list_programs "$language"); do
			printf '  %s\n' "${COLOR_RESET}$program${COLOR_RESET}"
		done
		printf '\n'
	done
}

function list_languages {
	directory::list_subdirectories --exclude-hidden "$base_directory"
}

function list_programs {
	directory::list_subdirectories --exclude-hidden "$base_directory/${1:?}"
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
		elif [[ $# -ge 1 && "$1" == "--prime" ]]; then
			option_prime="true"; shift
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

function prime {
	error "Not implemented."
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
		  --prime           Pre-generates image(s) without running them.
		  --help            Show this help message.
		  --interactive     Begin an interaction session.
		  --version         Show version information.

		Commands:
		  clean                      Remove stored images and containers.
		  list                       List languages and their programs.
		  run                        Run all languages and programs.
		  run <LANGUAGE>             Run all programs for a language.
		  run <LANGUAGE> <PROGRAM>   Run a specific language's program.

		EOF
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

	local -a environment_options=(
		"--env" "DEBUG=$option_debug"
		"--env" "DEBUG_DOCKER=$option_debug_docker"
		"--env" "DEBUG_PROGRAM=$option_debug_program"
		"--env" "DEBUG_SETUP=$option_debug_setup")

	language_hash=$(directory::hash "$base_directory/$language/.language")
	program_hash=$(directory::hash "$base_directory/$language/$program")

	language_hash=$(string::hash --length 16 "${system_hash}${language_hash}")
	program_hash=$(string::hash --length 16 "${system_hash}${language_hash}${program_hash}")

	if [[ "$option_debug_docker" == "false" ]]; then
		stdout="/dev/null"
	else
		build_quiet_argument=()
	fi

	if [[ "$option_debug_setup" == "false" ]]; then
		setup_stdout="/dev/null"
	fi

	start_docker_if_necessary

	function build_system_image {
		if docker::image_exists "languages:$system_hash"; then
			return
		fi

		podman build \
			--build-arg DEBUG_DOCKER="$option_debug_docker" \
			--file "$base_directory_native/.docker/system/system.dockerfile" \
			--tag "languages:latest" \
			"${build_quiet_argument[@]}" \
			"$base_directory_native" > "$stdout"

		container_id=$( \
			podman run \
				--detach \
				--privileged \
				--systemd=always \
				"languages")

		podman exec \
			"${environment_options[@]}" \
			"$container_id" \
			/usr/bin/bash /setup/system/setup-post.sh > "$stdout" 2>&1

		podman stop "$container_id" > "$stdout"
		podman commit "$container_id" "languages:latest" > "$stdout" 2>&1
		podman commit "$container_id" "languages:$system_hash" > "$stdout" 2>&1
		podman container rm "$container_id" > "$stdout"
	}

	function build_language_image {
		if docker::image_exists "languages-$language:$language_hash"; then
			return
		fi

		podman build \
			--build-arg DEBUG_DOCKER="$option_debug_docker" \
			--build-arg LANGUAGE="$language" \
			--file "$base_directory_native/.docker/language/language.dockerfile" \
			--tag "languages-$language:latest" \
			"${build_quiet_argument[@]}" \
			"$base_directory_native" > "$stdout"

		container_id=$( \
			podman run \
				--detach \
				--privileged \
				--systemd=always \
				"languages-$language")

		podman exec \
			"${environment_options[@]}" \
			"$container_id" \
			/usr/bin/bash /setup/language/setup-pre.sh > "$setup_stdout" 2>&1

		podman stop "$container_id" > "$stdout"
		podman commit "$container_id" "languages-$language:latest" > "$stdout" 2>&1
		podman commit "$container_id" "languages-$language:$language_hash" > "$stdout" 2>&1
		podman container rm "$container_id" > "$stdout"
	}

	function build_program_image {
		if docker::image_exists "languages-$language-$program:$program_hash"; then
			return
		fi

		podman build \
			--build-arg LANGUAGE="$language" \
			--build-arg PROGRAM="$program" \
			--file "$base_directory_native/.docker/program/program.dockerfile" \
			--tag "languages-$language-$program:latest" \
			--tag "languages-$language-$program:$program_hash" \
			"${build_quiet_argument[@]}" \
			"$base_directory_native" > "$stdout"
	}

	function execute {
		container_id=$( \
			podman run \
				--detach \
				--name "languages" \
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
		fi

		podman exec "${arguments[@]}" 2>&1 || true

		podman container stop "$container_id" > "$stdout"
	}

	if [[ "$option_debug" == "true" ]]; then
		set -x
	fi

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

	for language in $(list_languages); do
		run_language "$language"
	done
}

function run_language {
	if [[ $# -ne 1 ]]; then
		error::usage "run_language <language>"
	fi

	local language="$1"

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
	local language_properties_path
	local program_properties_path

	language_properties_path="$base_directory/$language/.language/$language_properties_filename"
	program_properties_path="$base_directory/$language/$program/$program_properties_filename"

	if [[ ! -f "$language_properties_path" ]]; then
		error "Missing \"$language_properties_filename\" file in \"$language\" directory."
	elif [[ ! -f "$program_properties_path" ]]; then
		error "Missing \"$program_properties_filename\" file in \"$language/$program\" directory."
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

	print_banner "$language_name" "${language_version:-?}" "$program_name"

	echo
	run "$@" | indent
	echo
}

function start_docker_if_necessary {
	if docker::is_started; then
		return
	fi

	status::temporary "Starting Docker..."
	docker::start
	status::temporary --clear
}

main "$@"
