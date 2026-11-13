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
  local floor="$PLACE_START"

  for ((places="$floor"; floor < num; floor *= 2)); do
    places="$floor"
  done
  echo "$places"
}

# === UNIT TESTS ====================================================
# next-place-value unit tests
# This tests if a value passed into it is equal to itself doubled
# separator
# printf '%s\n' "*** UNIT TESTING NEXT PLACE VALUE FUNCTION"

# for (( start=1; start<=10; start++ )); do
#   expected=$(( start * 2 ))
#   actual=$(next-place-value "$start")

#   if [[ "$actual" == "$expected" ]]; then
#     echo "PASS!" 
#     echo "$start -> $actual"
#     echo
#   else
#     echo "FAIL!"
#     echo "$start expected $expected got $actual"
#     echo
#   fi
# done

for (( start=1; start<=10; start++ )); do
  test=$(get-place "$start")
  echo "num: $start places: $test"
done