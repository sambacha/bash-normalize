# bash-normalize

## Abstract

< TODO >

## Erratta

```bash
# shellcheck disable=SC1091
source /root/.profile

set -euo pipefail

cd "$(dirname "${BASH_SOURCE[0]}")"/..
```

### Process control
Ctrl-C Interrupt (kill) current foreground process with SIGINT.
Ctrl-Z Suspend the current foreground process with SIGTSTP. Resume with fg.
Ctrl-D Close the bash shell with EOF (similar to exit).

#### Screen control
Ctrl-L Clear screen (similar to clear).
Ctrl-S Stop all output to screen (without stopping process itself).
Ctrl-Q Resume output to screen (after stopping with `Ctrl+S`).

### Cutting and Pasting
v      edit current command in text editor
;      redo last char find command
,      redo last character finding command opposite direction
y, yy, p, P work as usual in (neo)vim

### command history
k      move backwards on cmd in history
j      move forward on cmd in history
/str or Ctrl-r search backwards matching string
?str or Ctrl-s search forwards matching string
Tab or Ctrl-i or =   list possible completions
*               insert all possible completions
\#      prepend # to line and send it to history list
Ctrl-v insert char literally (quoted insert)

### Activate the terminal emulator bell
-- printf '\7'
-- printf '\a'
-- echo -ne '\7'
