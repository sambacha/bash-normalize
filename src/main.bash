# vim: ts=4 ft=sh

# For future tools / loadables, consider:
#[ -z "$BASH_LOADABLES_PATH" ] &&
#  BASH_LOADABLES_PATH=$(pkg-config bash --variable=loadablesdir 2>/dev/null)

set -u

export LC_ALL=C

# If no debug override has been done yet
if [[ -z "${PS4:-}" ]] || [[ "$PS4" == "+ " ]]; then
	PS4=' (${BASH_SOURCE##*/}:$LINENO ${FUNCNAME[0]:-main})  '
fi

#
# Survivor env check (for run with  "env -i")
#
if [[ -z "${PATH:-}" ]]; then
	export PATH="/bin:/usr/bin:/sbin:/usr/sbin"
fi
if [[ -z "${HOME:-}" ]]; then
	HOME="$(getent passwd $(id -u))"
	HOME="${HOME%:*}"
	export HOME="${HOME##*:}"
fi

#
# Compatibility check
#

# Check if we are using bash, else try to load the wrapper
#if [[ -z "$BASH" ]] || [[ "$(cat /proc/$$/comm)" != "bash" ]]; then
	# TODO Try to find a valid wrapper
#	:
#fi

# Minimal bash version
if [[ "${BASH_VERSINFO[0]:-}${BASH_VERSINFO[1]:-0}" -lt 42 ]]; then
	echo >&2 "This requires bash >= 4.2 to run."
	return 1 2>/dev/null
	exit 1
fi

# Enable extdebug to have arguments for trace
if [[ -n "${BASHNORMALIZE_DEBUG:-}" ]]; then
	shopt -s extdebug
fi

# Start at the end:
[[ ${BASH_SOURCE[0]} != "$0" ]] || main "$@"
