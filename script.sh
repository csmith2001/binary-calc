#!/bin/bash
trap 'echo "An error has occurred!"; exit 1' ERR
set -euo pipefail

# === FUNCTIONS ======================================
max_power_two() {
  local decimal_number=$1
  local max_power=1
  local places=1

  for (( ; places < decimal_number; places *= 2 )); do
    max_power="$places"
  done
  echo "$max_power"
}

base10_to_binary() {
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

base10_to_binary 345