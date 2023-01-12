#!/usr/bin/env bash

# Since bash 5.0, checkwinsize is enabled by default which does
# update the COLUMNS variable every time a non-builtin command
# completes, even for non-interactive shells.
# Disable that since we are aiming for repeatability.
test -n "$BASH_VERSION" && shopt -u checkwinsize 2>/dev/null

# For repeatability, reset the environment to known value.
# TERM is sanitized below, after saving color control sequences.
LANG=C
LC_ALL=C
PAGER=cat
TZ=UTC
COLUMNS=80
export LANG LC_ALL PAGER TZ COLUMNS
EDITOR=:




if [ "$1" == "-h" ]; then
  usage
  exit 1
fi

# shellcheck disable=SC1091
source /root/.profile

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"/..
