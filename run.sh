#!/bin/bash

main() {
  setup_cache
  set +e
  nuget_restore
  set -e

  success "Finished NuGet restore"
}

setup_cache() {
  mkdir -p "$WERCKER_CACHE_DIR/wercker/nuget"
  nuget sources add -name WerckerCache -source "$WERCKER_CACHE_DIR/wercker/nuget"
}

nuget_restore() {
  local retries=3;
  for try in $(seq "$retries"); do
    info "Starting NuGet restore, try: $try"
    nuget restore "$WERCKER_NUGET_RESTORE_OPTIONS" && return;
  done

  fail "Failed to successfully execute NuGet restore, retries: $retries"
}

main;
