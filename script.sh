#!/bin/bash
set -euo pipefail
trap 'echo "An error has occurred!"; exit 1' ERR

# === CONSTANTS ==================================================================
TERM_WIDTH=$(tput cols)

# === FUNCTIONS ==================================================================
separator() {
  local char="${1:-=}"
  printf '%*s\n' "$TERM_WIDTH" '' | tr ' ' "$char"
}

max_power_two() {
  local decimal_number=$1
  local max_power=1
  local places=1

  for (( ; places < decimal_number; places *= 2 )); do
    max_power="$places"
  done
  echo "$max_power"
}

get_remainder() {
  local decimal_number=$1
  local max_power=$2
  local remainder

  max_power=$(max_power_two "$decimal_number")
  if [ "$max_power" -eq 1 ]; then
    remainder=0
  else
    remainder=$(( decimal_number - max_power ))
  fi
  echo "$remainder"
}

convert_to_binary() {
  local decimal_number=$1
  local max_power
  local new_num

  max_power=$(max_power_two "$decimal_number")
  new_num=$decimal_number

  for (( ; max_power >= 1; max_power /= 2 )); do
    if (( max_power <= new_num )); then
      binary+="1"
      new_num=$(( new_num - max_power ))
    else
      binary+="0"
    fi
  done
  echo "$binary"
}

convert_to_binary 345