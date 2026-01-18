set -Eeuo pipefail

declare -x cache_directory="/tmp/library-cache"
declare -x hash_program="/usr/bin/sha256sum"
declare -x TAB="    "
declare -x CHARACTER_AMPERSAND="&"
declare -x CHARACTER_ASTERISK="*"
declare -x CHARACTER_AT="@"
declare -x CHARACTER_BACKSLASH="\\"
declare -x CHARACTER_BACKSLASH_ESCAPED="\\\\"
declare -x CHARACTER_BACKSPACE=$'\177'
declare -x CHARACTER_BACKSPACE_ALT=$'\b'
declare -x CHARACTER_BACKTICK="\`"
declare -x CHARACTER_CARET="^"
declare -x CHARACTER_COLON=":"
declare -x CHARACTER_COMMA=","
declare -x CHARACTER_CR=$'\r'
declare -x CHARACTER_CURLY_BRACKET_CLOSE="}"
declare -x CHARACTER_CURLY_BRACKET_OPEN="{"
declare -x CHARACTER_DASH="-"
declare -x CHARACTER_DOLLAR="\$"
declare -x CHARACTER_DOUBLE_QUOTE="\""
declare -x CHARACTER_DOUBLE_QUOTE_ESCAPED="\\\""
declare -x CHARACTER_ELLIPSIS=$'â\200¦'
declare -x CHARACTER_EQUALS="="
declare -x CHARACTER_ESCAPE=$'\E'
declare -x CHARACTER_EXCLAMATION="!"
declare -x CHARACTER_FORWARD_SLASH="/"
declare -x CHARACTER_GT=">"
declare -x CHARACTER_HYPHEN="-"
declare -x CHARACTER_LF=$'\n'
declare -x CHARACTER_LT="<"
declare -x CHARACTER_MINUS="-"
declare -x CHARACTER_NULL=""
declare -x CHARACTER_PARENTHASES_CLOSE=")"
declare -x CHARACTER_PARENTHASES_OPEN="("
declare -x CHARACTER_PERCENT="%"
declare -x CHARACTER_PERIOD="."
declare -x CHARACTER_PIPE="|"
declare -x CHARACTER_PLUS="+"
declare -x CHARACTER_POUND="#"
declare -x CHARACTER_QUESTION_MARK="?"
declare -x CHARACTER_SEMICOLON=";"
declare -x CHARACTER_SINGLE_QUOTE="'"
declare -x CHARACTER_SPACE=" "
declare -x CHARACTER_SPACE_ESCAPED="\\ "
declare -x CHARACTER_SQUARE_BRACKET_CLOSE="["
declare -x CHARACTER_SQUARE_BRACKET_OPEN="]"
declare -x CHARACTER_TAB=$'\t'
declare -x CHARACTER_TILDE="~"
declare -x CHARACTER_UNDERSCORE="_"
declare -x CHARACTER_ZERO="0"
declare -x COLOR_BLACK=$'\E[0;30m'
declare -x COLOR_BLUE=$'\E[0;34m'
declare -x COLOR_CYAN=$'\E[0;36m'
declare -x COLOR_GRAY=$'\E[2;37m'
declare -x COLOR_GREEN=$'\E[0;32m'
declare -x COLOR_MAGENTA=$'\E[0;35m'
declare -x COLOR_RED=$'\E[0;31m'
declare -x COLOR_RESET=$'\E[0;0m'
declare -x COLOR_WHITE=$'\E[0;97m'
declare -x COLOR_YELLOW=$'\E[0;33m'
declare -x INTEGER_MAX="9223372036854775807"
declare -x INTEGER_MIN="-9223372036854775808"
declare -x INTEGER_SIGNED_MAX_LENGTH="20"
declare -x INTEGER_UNSIGNED_MAX_LENGTH="19"
declare -x KERNEL_TYPE_LINUX="linux"
declare -x KERNEL_TYPE_MAC="mac"
declare -x KERNEL_TYPE_WINDOWS="windows"
declare -x KERNEL_TYPE_WSL="wsl"
declare -x PATTERN_ALPHABETIC="^[a-zA-Z]+\$"
declare -x PATTERN_BEGINS_WITH_MINUS_SIGN="^-"
declare -x PATTERN_DECIMAL="^[-+]?[0-9]+(\\.[0-9]+)?\$"
declare -x PATTERN_DECIMAL_ZERO="^[-+]?0+(\\.0+)?\$"
declare -x PATTERN_HEX="^[a-fA-F0-9]+\$"
declare -x PATTERN_IDENTIFIER="^[a-zA-Z_][a-zA-Z0-9_]*\$"
declare -x PATTERN_INTEGER="^[-+]?[0-9]+\$"
declare -x PATTERN_INTEGER_ZERO="^[-+]0+\$"
declare -x PATTERN_ZERO="^[-+]?0+(\\.0+)?\$"
declare -x S_INT_16_MAX="32767"
declare -x S_INT_16_MIN="-32768"
declare -x S_INT_32_MAX="2147483647"
declare -x S_INT_32_MIN="-2147483648"
declare -x S_INT_64_MAX="9223372036854775807"
declare -x S_INT_64_MIN="-9223372036854775808"
declare -x S_INT_8_MAX="127"
declare -x S_INT_8_MIN="-128"
declare -x STATUS_BOX=$'\E[2;37m[   ]\E[0;0m'
declare -x STATUS_FALSE="1"
declare -x STATUS_GRAY=$'â\234\223'
declare -x STATUS_GREEN=$'â\234\223'
declare -x STATUS_RED=$'â\234\227'
declare -x STATUS_SIGABRT="134"
declare -x STATUS_SIGALRM="142"
declare -x STATUS_SIGBUS="135"
declare -x STATUS_SIGCHLD="145"
declare -x STATUS_SIGCONT="146"
declare -x STATUS_SIGFPE="136"
declare -x STATUS_SIGHUP="129"
declare -x STATUS_SIGILL="132"
declare -x STATUS_SIGINT="130"
declare -x STATUS_SIGIO="157"
declare -x STATUS_SIGKILL="137"
declare -x STATUS_SIGNAL_OFFSET="128"
declare -x STATUS_SIGPIPE="141"
declare -x STATUS_SIGPROF="155"
declare -x STATUS_SIGPWR="158"
declare -x STATUS_SIGQUIT="131"
declare -x STATUS_SIGSEGV="139"
declare -x STATUS_SIGSTKFLT="144"
declare -x STATUS_SIGSTOP="147"
declare -x STATUS_SIGSYS="159"
declare -x STATUS_SIGTERM="143"
declare -x STATUS_SIGTRAP="133"
declare -x STATUS_SIGTSTP="148"
declare -x STATUS_SIGTTIN="149"
declare -x STATUS_SIGTTOU="150"
declare -x STATUS_SIGURG="151"
declare -x STATUS_SIGUSR1="138"
declare -x STATUS_SIGUSR2="140"
declare -x STATUS_SIGVTALRM="154"
declare -x STATUS_SIGWINCH="156"
declare -x STATUS_SIGXCPU="152"
declare -x STATUS_SIGXFSZ="153"
declare -x STATUS_TRUE="0"
declare -x TERMINAL_CLEAR=$'\r\E[K'
declare -x TERMINAL_DOWN=$'\E[B'
declare -x TERMINAL_LEFT=$'\E[D'
declare -x TERMINAL_RIGHT=$'\E[C'
declare -x TERMINAL_START=$'\r'
declare -x TERMINAL_UP=$'\E[A'
declare -x UNDERLINE_BEGIN=$'\E[4m'
declare -x UNDERLINE_END=$'\E[24m'
assert::integer () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "assert::integer <value>";
    fi;
    local value=$1;
    if ! integer::is_integer "$value"; then
        error "Value \"$value\" is not a valid integer.";
    fi
}
assert::integer_range () 
{ 
    if [[ $# -ne 3 ]]; then
        error::usage "assert::integer_range <minimum> <maximum> <value>";
    fi;
    local minimum="$1";
    local maximum="$2";
    local value="$3";
    assert::integer "$value";
    assert::integer "$minimum";
    assert::integer "$maximum";
    if [[ $value -lt $minimum ]]; then
        error "Value $value is less than $minimum.";
    else
        if [[ $value -gt $maximum ]]; then
            error "Value $value is greater than $maximum.";
        else
            return "$STATUS_TRUE";
        fi;
    fi
}
cache::get_path () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "cache::get_path <key>";
    fi;
    local key="$1";
    local key_hex;
    local path;
    if [[ -z "$key" ]]; then
        error "Empty cache key.";
    fi;
    key_hex=$(string::to_hex "$key");
    path="${cache_directory:?}/${key_hex:?}";
    if [[ ! -f "$path" ]]; then
        touch "$path";
        chmod 666 "$path";
    fi;
    echo -n "${path:?}"
}
cache::initialize () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "cache::initialize";
    fi;
    if [[ ! -d "${cache_directory:?}" ]]; then
        mkdir -p "${cache_directory:?}";
        if ! platform::is_windows; then
            chmod 1777 "${cache_directory:?}";
        fi;
    fi
}
cache::set () 
{ 
    if [[ $# -ne 2 ]]; then
        error::usage "cache::set <key> <value>";
    fi;
    local key="$1";
    local value="$2";
    local path;
    if [[ "${CACHE_DISABLE:-0}" == "1" ]]; then
        return;
    fi;
    path=$(cache::get_path "$key");
    if [[ -z "$value" ]]; then
        error "Cannot write empty string to cache (key '$key').";
    fi;
    echo -n "${value:?}" > "$path"
}
cache::try_get () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "cache::try_get <key>";
    fi;
    local key="$1";
    local path;
    if [[ "${CACHE_DISABLE:-0}" == "1" ]]; then
        return;
    fi;
    path=$(cache::get_path "$key");
    cat "${path:?}" 2> /dev/null || true
}
directory::current () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "directory::current";
    fi;
    local working_directory;
    working_directory=$(pwd);
    printf '%s' "$working_directory"
}
directory::does_not_exist () 
{ 
    ! directory::exists "$@"
}
directory::exists () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "directory::exists <path>";
    fi;
    local path="$1";
    if [[ -d "$path" ]]; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
directory::hash () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "directory::hash <path>";
    fi;
    local path;
    local hasher="${HASH_PROGRAM:-$hash_program}";
    path="$1";
    path=$(readlink -f "$path");
    if directory::does_not_exist "$path"; then
        error "Directory \"$path\" does not exist.";
    fi;
    find "$path" -type f -print0 | sort --zero-terminated | env --basic xargs --null "$hasher" | "$hasher" | cut --delimiter=' ' --fields=1
}
directory::list_subdirectories () 
{ 
    local option_exclude_hidden="false";
    local option_exclude_symlinks="false";
    local path;
    local subdirectories;
    while true; do
        if [[ $# -ge 1 && "$1" == "--exclude-hidden" ]]; then
            option_exclude_hidden="true";
            shift;
        else
            if [[ $# -ge 1 && "$1" == "--exclude-symlinks" ]]; then
                option_exclude_symlinks="true";
                shift;
            else
                break;
            fi;
        fi;
    done;
    if [[ $# -eq 0 ]]; then
        path=$(directory::current);
    else
        if [[ $# -eq 1 ]]; then
            path="$1";
        else
            error::usage "directory::list_subdirectories [--exclude-hidden] [--exclude-symlinks] [path]";
        fi;
    fi;
    if [[ "$option_exclude_symlinks" == "true" ]]; then
        subdirectories=$(find "$path" -mindepth 1 -maxdepth 1 -type d -printf '%f\n');
    else
        subdirectories=$(find "$path" -mindepth 1 -maxdepth 1 '(' -type d -o -xtype d ')' -printf '%f\n');
    fi;
    subdirectories=$(echo "$subdirectories" | sort);
    if [[ "$option_exclude_hidden" == "true" ]]; then
        for subdirectory in $subdirectories;
        do
            if [[ "$subdirectory" == .* ]]; then
                continue;
            fi;
            echo "$subdirectory";
        done;
    else
        echo "$subdirectories";
    fi
}
docker::image_exists () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "docker::image_exists <tag>";
    fi;
    local tag="$1";
    if docker image exists "$tag"; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
docker::is_started () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "docker::is_started";
    fi;
    if docker info > /dev/null 2>&1; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
docker::start () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "docker::start";
    fi;
    if docker::is_started; then
        return;
    fi;
    if which "podman" > /dev/null 2>&1; then
        if ! is_linux; then
            podman machine init > /dev/null 2>&1 || true;
            podman machine start > /dev/null 2>&1 || true;
        fi;
    else
        if which "docker" > /dev/null 2>&1; then
            powershell::command <<-EOF
Start-Process "$PROGRAMFILES\Docker\Docker\Docker Desktop.exe"
EOF

        fi;
    fi
    for _ in {1..60};
    do
        if docker::is_started; then
            break;
        fi;
        sleep 1;
    done
}
env () 
{ 
    if [[ $# -eq 0 ]]; then
        error::usage "env [--basic] [OPTION]... -- [COMMAND [ARG]...]";
    fi;
    if [[ "$1" == "--basic" ]]; then
        shift;
        set -- HOME="${HOME:-}" PATH="${PATH:-}" PWD="${PWD:-}" SHELL="${SHELL:-}" TERM="${TERM:-}" USER="${USER:-}" "$@";
        if platform::is_windows_or_wsl; then
            if platform::is_wsl; then
                local SYSTEMDRIVE SYSTEMROOT USERNAME USERPROFILE;
                SYSTEMDRIVE=$(windows::environment::get_variable "SYSTEMDRIVE");
                SYSTEMROOT=$(windows::environment::get_variable "SYSTEMROOT");
                USERNAME=$(windows::environment::get_variable "USERNAME");
                USERPROFILE=$(windows::environment::get_variable "USERPROFILE");
            fi;
            set -- SYSTEMDRIVE="${SYSTEMDRIVE:-}" SYSTEMROOT="${SYSTEMROOT:-}" USERNAME="${USERNAME:-}" USERPROFILE="${USERPROFILE:-}" "$@";
        fi;
        set -- "--ignore-environment" "$@";
    fi;
    /usr/bin/env "$@"
}
error () 
{ 
    error::error "$@"
}
error::error () 
{ 
    function incorrect_usage () 
    { 
        echo "Usage: error [--status STATUS] <message|STDIN>" 1>&2;
        exit 1
    };
    local message;
    local message_colorized;
    local message_plaintext;
    local status=1;
    local default_preamble="Error";
    local preamble="${PREAMBLE:-$default_preamble}";
    while true; do
        if [[ $# -ge 2 && "$1" == "--status" ]]; then
            status="$2";
            shift;
            shift;
        else
            if [[ $# -eq 1 ]] && stdin::is_not_piped; then
                message="$1";
                break;
            else
                if [[ $# -eq 0 ]] && stdin::is_piped; then
                    message=$(cat);
                    message=$(printf '\n%s' "$message");
                    break;
                else
                    incorrect_usage;
                fi;
            fi;
        fi;
    done;
    assert::integer "$status";
    assert::integer_range 1 255 "$status";
    message_colorized="${COLOR_RED}${preamble}:${COLOR_RESET} $message";
    message_plaintext="${preamble}: $message";
    if stdout::is_interactive; then
        echo "$message_colorized" 1>&2;
    else
        echo "$message_plaintext" 1>&2;
    fi;
    exit "$status"
}
error::usage () 
{ 
    PREAMBLE="Usage" error::error "$@"
}
indent () 
{ 
    if [[ $# -ne 0 ]]; then
        error "Usage: indent";
    fi;
    declare PREFIX="${COLOR_GRAY}${CHARACTER_GT}${COLOR_RESET}${TAB}";
    if stdin::is_interactive; then
        return;
    fi;
    sed "s/^/$PREFIX/"
}
integer::is_integer () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "integer::is_integer <value>";
    fi;
    local value="$1";
    local value_length=${#value};
    function invalid_pattern () 
    { 
        [[ ! $value =~ $PATTERN_INTEGER ]]
    };
    function is_length_short () 
    { 
        [[ $value_length -lt $INTEGER_UNSIGNED_MAX_LENGTH ]]
    };
    function within_range () 
    { 
        awk --bignum "BEGIN { exit ($value < $INTEGER_MIN || $value > $INTEGER_MAX) }"
    };
    if invalid_pattern; then
        return "$STATUS_FALSE";
    else
        if is_length_short; then
            return "$STATUS_TRUE";
        else
            if within_range; then
                return "$STATUS_TRUE";
            else
                return "$STATUS_FALSE";
            fi;
        fi;
    fi
}
not-implemented () 
{ 
    error "Not implemented."
}
path::convert () 
{ 
    local input_path;
    local output_format_default="unix";
    local output_format="$output_format_default";
    local output_path;
    local cygpath;
    local wslpath;
    while true; do
        if [[ $# -ge 1 && "$1" == "-m" ]]; then
            output_format="mixed";
        else
            if [[ $# -ge 1 && "$1" == "--mixed" ]]; then
                output_format="mixed";
            else
                if [[ $# -ge 1 && "$1" == "-n" ]]; then
                    output_format="native";
                else
                    if [[ $# -ge 1 && "$1" == "--native" ]]; then
                        output_format="native";
                    else
                        if [[ $# -ge 1 && "$1" == "-u" ]]; then
                            output_format="unix";
                        else
                            if [[ $# -ge 1 && "$1" == "--unix" ]]; then
                                output_format="unix";
                            else
                                if [[ $# -ge 1 && "$1" == "-w" ]]; then
                                    output_format="windows";
                                else
                                    if [[ $# -ge 1 && "$1" == "--windows" ]]; then
                                        output_format="windows";
                                    else
                                        break;
                                    fi;
                                fi;
                            fi;
                        fi;
                    fi;
                fi;
            fi;
        fi;
        shift;
    done;
    if [[ $# -ne 1 ]]; then
        error::usage "path::convert [-m|--mixed, -n|--native, -u|--unix, -w|--windows] <path>";
    fi;
    function is_absolute_unix_path () 
    { 
        [[ "$1" == /* ]]
    };
    function is_absolute_windows_path () 
    { 
        [[ "$1" =~ ^[A-Z]: ]]
    };
    input_path="$1";
    if [[ "$output_format" == "native" ]]; then
        if platform::is_windows; then
            output_format="windows";
        else
            output_format="unix";
        fi;
    fi;
    if platform::is_windows; then
        cygpath="/usr/bin/cygpath.exe";
        output_path=$("$cygpath" --type "$output_format" "$input_path");
    else
        if platform::is_wsl; then
            wslpath="/usr/bin/wslpath";
            if [[ "$output_format" == "mixed" ]]; then
                output_path=$("$wslpath" -m "$input_path");
            else
                if [[ "$output_format" == "unix" ]]; then
                    if is_absolute_unix_path "$input_path"; then
                        output_path="$input_path";
                    else
                        output_path=$("$wslpath" -u "$input_path");
                    fi;
                else
                    if [[ "$output_format" == "windows" ]]; then
                        if is_absolute_windows_path "$input_path"; then
                            output_path="$input_path";
                        else
                            output_path=$("$wslpath" -w "$input_path");
                        fi;
                    else
                        error "Unsupported output format '$output_format'.";
                    fi;
                fi;
            fi;
        else
            if [[ "$output_format" == "unix" ]]; then
                output_path="$input_path";
            else
                not-implemented;
            fi;
        fi;
    fi;
    echo -n "$output_path"
}
platform::get_kernel_type () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "platform::get_kernel_type";
    fi;
    local cached;
    cached=$(cache::try_get "kernel-type");
    if [[ -n "$cached" ]]; then
        echo -n "$cached";
        return;
    fi;
    local kernel_type="?";
    local kernel_os=$(string::to_lower $(uname --operating-system));
    local kernel_name=$(string::to_lower $(uname --kernel-name));
    local kernel_release=$(string::to_lower $(uname --kernel-release));
    if [[ "$kernel_name" =~ mingw ]]; then
        kernel_type="$KERNEL_TYPE_WINDOWS";
    else
        if [[ "$kernel_name" =~ msys ]]; then
            kernel_type="$KERNEL_TYPE_WINDOWS";
        else
            if [[ "$kernel_name" =~ cygwin ]]; then
                kernel_type="$KERNEL_TYPE_WINDOWS";
            else
                if [[ "$kernel_name" =~ darwin ]]; then
                    kernel_type="$KERNEL_TYPE_MAC";
                else
                    if [[ "$kernel_name" =~ linux ]]; then
                        if [[ "$kernel_release" =~ microsoft ]]; then
                            if platform::is_container; then
                                kernel_type="$KERNEL_TYPE_LINUX";
                            else
                                kernel_type="$KERNEL_TYPE_WSL";
                            fi;
                        else
                            kernel_type="$KERNEL_TYPE_LINUX";
                        fi;
                    else
                        error "Unknown kernel: OS = '$kernel_os', Name = '$kernel_name', Release = '$kernel_release'.";
                    fi;
                fi;
            fi;
        fi;
    fi;
    cache::set "kernel-type" "$kernel_type";
    echo -n "$kernel_type"
}
platform::is_container () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "platform::is_container";
    fi;
    if [[ -f "/.dockerenv" ]]; then
        return "$STATUS_TRUE";
    fi;
    if [[ -d "/mnt/c" ]]; then
        return "$STATUS_FALSE";
    fi;
    if command -v systemd-detect-virt > /dev/null 2>&1; then
        if systemd-detect-virt --container --quiet; then
            return "$STATUS_TRUE";
        fi;
    fi;
    if [[ -r /proc/1/cgroup ]] && grep -Eq 'docker|lxc|kubepods|containerd|podman' /proc/1/cgroup; then
        return "$STATUS_TRUE";
    fi;
    if [[ -r /proc/1/mountinfo ]] && grep -Eq '/docker/|/containers/|/kubepods' /proc/1/mountinfo; then
        return "$STATUS_TRUE";
    fi;
    return "$STATUS_FALSE"
}
platform::is_windows () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "platform::is_windows";
    fi;
    local kernel_type;
    kernel_type=$(platform::get_kernel_type);
    if [[ "$kernel_type" == "$KERNEL_TYPE_WINDOWS" ]]; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
platform::is_windows_or_wsl () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "platform::is_windows_or_wsl";
    fi;
    if platform::is_windows || platform::is_wsl; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
platform::is_wsl () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "platform::is_wsl";
    fi;
    local kernel_type;
    kernel_type=$(platform::get_kernel_type);
    if [[ "$kernel_type" == "$KERNEL_TYPE_WSL" ]]; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
program::get_script_directory () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "program::get_script_directory";
    fi;
    local script_path;
    local script_directory;
    script_path=$(program::get_script_path);
    script_directory=$(dirname "$script_path");
    echo "$script_directory"
}
program::get_script_path () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "program::get_script_path";
    fi;
    local script_path;
    script_path=$(readlink -f "$0");
    if [[ "$script_path" == *:* ]]; then
        script_path=$(path::convert -u "$script_path");
    fi;
    echo -n "$script_path"
}
status::temporary () 
{ 
    function incorrect_usage () 
    { 
        error::usage "status::temporary [--clear] <message>"
    };
    local option_clear="false";
    local message;
    while true; do
        if [[ $# -ge 1 && "$1" == "--clear" ]]; then
            option_clear="true";
            shift;
        else
            break;
        fi;
    done;
    if [[ "$option_clear" == "true" ]]; then
        if [[ $# -ne 0 ]]; then
            incorrect_usage;
        fi;
    else
        if [[ $# -ne 1 ]]; then
            incorrect_usage;
        fi;
        message="$1";
    fi;
    if [[ "$option_clear" == "true" ]]; then
        if [[ -t 1 ]]; then
            echo -en "${TERMINAL_CLEAR}" > /dev/tty;
        fi;
    else
        if [[ -t 1 ]]; then
            echo -en "${TERMINAL_CLEAR}${COLOR_GRAY}${message}${COLOR_RESET}" > /dev/tty;
        fi;
    fi
}
stdin::is_interactive () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "stdin::is_interactive";
    fi;
    if [[ -t 0 ]]; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
stdin::is_not_interactive () 
{ 
    ! stdin::is_interactive "$@"
}
stdin::is_not_piped () 
{ 
    ! stdin::is_piped "$@"
}
stdin::is_piped () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "stdin::is_piped";
    fi;
    if [[ -p /dev/stdin ]]; then
        return "$STATUS_TRUE";
    else
        return "$STATUS_FALSE";
    fi
}
stdout::is_interactive () 
{ 
    if [[ $# -ne 0 ]]; then
        error::usage "stdout::is_interactive";
    fi;
    if [[ -t 1 ]]; then
        return $STATUS_TRUE;
    else
        return $STATUS_FALSE;
    fi
}
string::hash () 
{ 
    local -i length="$INTEGER_MAX";
    if [[ $# -ge 2 && "$1" == "--length" ]]; then
        length="$2";
        shift;
        shift;
    fi;
    if [[ $# -ne 1 ]]; then
        error::usage "string::hash [--length LENGTH] <value>";
    fi;
    local value="$1";
    local hasher="${HASH_PROGRAM:-$hash_program}";
    local hash;
    hash=$(echo -n "$value" | "$hasher" | cut --delimiter=' ' --fields=1);
    hash="${hash:0:$length}";
    echo -n "$hash"
}
string::to_hex () 
{ 
    function incorrect_usage () 
    { 
        error::usage "string::to_hex <STDIN|value>"
    };
    if [[ $# -eq 0 ]]; then
        if [[ -t 0 ]]; then
            incorrect_usage;
        else
            cat | xxd -p -c "$S_INT_32_MAX" | tr -d '\n';
        fi;
    else
        if [[ $# -eq 1 ]]; then
            printf "%s" "$1" | xxd -p -c "$S_INT_32_MAX" | tr -d '\n';
        else
            incorrect_usage;
        fi;
    fi
}
string::to_lower () 
{ 
    string::to_lowercase "$@"
}
string::to_lowercase () 
{ 
    if [[ $# -ne 1 ]]; then
        error::usage "string::to_lowercase <value>";
    fi;
    local value="$1";
    local value_lowercase="${value,,}";
    printf "%s" "$value_lowercase"
}
