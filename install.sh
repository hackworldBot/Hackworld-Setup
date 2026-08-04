#!/usr/bin/env bash

set -Eeuo pipefail

# ==========================================
# Hackworld Setup
# Main Entry Point
# ==========================================

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "${ROOT_DIR}/lib/bootstrap.sh"

main() {

    log_info "Starting Hackworld Setup"

    menu_main

}

main "$@"