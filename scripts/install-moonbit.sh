#!/usr/bin/env bash
# Install the MoonBit toolchain release pinned in msr/toolchains.toml
# ([install] moonbit) into ~/.moon, and refuse to continue if `moonc`
# reports another version. CI calls this instead of the installer's
# "latest", so an upstream release cannot change the toolchain unannounced.
set -euo pipefail

cd "$(dirname "$0")/.."

version=$(sed -n '/^\[install\]/,/^\[/{s/^moonbit *= *"\([^"]*\)".*/\1/p;}' msr/toolchains.toml)
[ -n "$version" ] || { echo "msr/toolchains.toml has no [install] moonbit" >&2; exit 1; }

curl -fsSL https://cli.moonbitlang.com/install/unix.sh | bash -s -- "$version"

got=$("$HOME/.moon/bin/moonc" -v 2>&1 | head -n1)
case "$got" in
  "v$version "*|"v$version") ;;
  *) echo "msr/toolchains.toml pins MoonBit $version but the installed moonc is '$got'" >&2; exit 1 ;;
esac
echo "installed MoonBit $version ($("$HOME/.moon/bin/moon" version | head -n1))"
