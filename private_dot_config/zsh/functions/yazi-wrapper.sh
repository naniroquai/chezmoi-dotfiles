# https://yazi-rs.github.io/docs/quick-start#shell-wrapper
# We suggest using this y shell wrapper that provides the ability to change the current working directory when exiting Yazi.

function y() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
  command yazi "$@" --cwd-file="$tmp"
  IFS= read -r -d '' cwd < "$tmp"
  [ "$cwd" != "$PWD" ] && [ -d "$cwd" ] && builtin cd -- "$cwd"
  command rm -f -- "$tmp"
}
