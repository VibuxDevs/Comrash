#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_DIR="${COMRASH_INSTALL_DIR:-$HOME/.local/share/comrash}"
BIN_DIR="${COMRASH_BIN_DIR:-$HOME/.local/bin}"

say() {
  printf '%s\n' "$*"
}

die() {
  printf 'error: %s\n' "$*" >&2
  exit 1
}

ensure_file() {
  local p="$1"
  [[ -e "$p" ]] || die "required file missing: $p"
}

ensure_file "$ROOT_DIR/comrash"
ensure_file "$ROOT_DIR/comrash.bashrc"
ensure_file "$ROOT_DIR/comrash.fish"
ensure_file "$ROOT_DIR/comradefetch"
[[ -d "$ROOT_DIR/zdotdir" ]] || die "required directory missing: $ROOT_DIR/zdotdir"

mkdir -p "$INSTALL_DIR" "$BIN_DIR" "$INSTALL_DIR/zdotdir"

# Install files (copy, not symlink, so removable media location is not required later).
install -m 0755 "$ROOT_DIR/comrash" "$INSTALL_DIR/comrash"
install -m 0755 "$ROOT_DIR/comradefetch" "$INSTALL_DIR/comradefetch"
install -m 0644 "$ROOT_DIR/comrash.bashrc" "$INSTALL_DIR/comrash.bashrc"
install -m 0644 "$ROOT_DIR/comrash.fish" "$INSTALL_DIR/comrash.fish"
install -m 0644 "$ROOT_DIR/zdotdir/.zshenv" "$INSTALL_DIR/zdotdir/.zshenv"
install -m 0644 "$ROOT_DIR/zdotdir/.zshrc" "$INSTALL_DIR/zdotdir/.zshrc"

# Command links.
ln -sfn "$INSTALL_DIR/comrash" "$BIN_DIR/comrash"
ln -sfn "$INSTALL_DIR/comradefetch" "$BIN_DIR/comradefetch"

say "Comrash installed to: $INSTALL_DIR"
say "Launch command: $BIN_DIR/comrash"

case ":$PATH:" in
  *":$BIN_DIR:"*)
    say "PATH already contains: $BIN_DIR"
    ;;
  *)
    say
    say "Add this to your shell profile so 'comrash' is found:"
    say "  export PATH=\"$BIN_DIR:\$PATH\""
    ;;
esac

say
say "Run: comrash"
