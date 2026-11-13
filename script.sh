#!/bin/bash
set -euo pipefail
trap 'echo "An error has occurred!"; exit 1' ERR

# === CONSTANTS =====================================================
PLACE_START=1
TERM_WIDTH=$(tput cols)

# === FUNCTIONS =====================================================
separator() {
  local char="${1:-=}"
  printf '%*s\n' "$TERM_WIDTH" '' | tr ' ' "$char"
}

next-place-value() {
  local num=$1
  local new_num=$(( num * 2 ))
  echo "$new_num"
}

get-place() {
  local num=$1
  local floor=$PLACE_START

  for ((places="$floor"; floor < num; floor *= 2)); do
    places="$floor"
  done
  echo "$places"
}

max-place() {
  local num=$1
  local start

  for (( start=1; start<=num; start++ )); do
    max_places=$(get-place "$start")
  done
  echo "$max_places"
}

get-binary() {
  local num=$1

  test=$(max-place "$num")
  echo "$test"
}

get-binary 345