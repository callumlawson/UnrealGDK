#!/usr/bin/env bash

set -e -u -o pipefail

cd "$(dirname "$0")/../../"

source ci/pinned-tools.sh
source ci/profiling.sh

markStartOfBlock "$0"

  markStartOfBlock "Unreal GDK source files"

  # TODO: UNR-195 fix .clang-format to fit our formatting requirements
  # "${IMP_LINT_BIN}" fix  \
  #   --linter cpp,json,git_merge_conflict \
  #   --exclude "Binaries/" \
  #   --exclude "build/" \
  #   --exclude "packages" \
  #   --exclude ".spatialos/" \
  #   --exclude ".vs/" \
  #   --exclude "Source/Programs/Improbable.Unreal.CodeGeneration.Example" \
  #   --exclude "go/src/improbable.io/vendor" \
  #   --exclude "Source/SpatialGDK/Public/WorkerSdk" \

  go run "${GOPATH}/src/improbable.io/linter/main.go" fix \
    "Source/SpatialGDK/Public" \
    "Source/SpatialGDK/Private" \
    "Source/SpatialGDK/Legacy" \
    "Plugins" \

 markEndOfBlock "Unreal GDK source files"

markEndOfBlock "$0"