#!/usr/bin/env bash

set -Eeuo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

LIB_DIR="${ROOT_DIR}/lib"
CONFIG_DIR="${ROOT_DIR}/config"
MODULE_DIR="${ROOT_DIR}/modules"
LOG_DIR="${ROOT_DIR}/logs"
REPORT_DIR="${ROOT_DIR}/reports"

readonly ROOT_DIR
readonly LIB_DIR
readonly CONFIG_DIR
readonly MODULE_DIR
readonly LOG_DIR
readonly REPORT_DIR

mkdir -p "${LOG_DIR}"
mkdir -p "${REPORT_DIR}"

load_library() {

    local library="$1"

    if [[ ! -f "${LIB_DIR}/${library}" ]]; then
        echo "ERROR: Missing library: ${library}"
        exit 1
    fi

    # shellcheck source=/dev/null
    source "${LIB_DIR}/${library}"
}

load_library "colors.sh"
load_library "logger.sh"
load_library "helpers.sh"
load_library "checks.sh"
load_library "system.sh"
load_library "menu.sh"