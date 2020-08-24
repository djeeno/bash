#!/bin/bash
set -E -e -o pipefail

cd "$(dirname "$0")" || exit 1

VERSION=v0.1.1
URL_BASE=djeeno.github.io/sh

copy_and_overwrite () {
  rm -rf ./"${1:?}" || true
  cp -a ../"${1:?}" .
  # shellcheck disable=SC2038
  find "${1:?}" -type f | xargs -I{} perl -pe "s|(${URL_BASE:?})/|\1/${VERSION:?}/|g" -i {}
}

for dir in asdf bashrc brew common direnv git peco; do
  copy_and_overwrite "${dir:?}"
done