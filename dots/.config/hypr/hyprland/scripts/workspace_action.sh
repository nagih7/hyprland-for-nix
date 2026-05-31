#!/usr/bin/env bash
curr_workspace="$(hyprctl activeworkspace -j | jq -r ".id")"
dispatcher="$1"
shift ## The target is now in $1, not $2

if [[ -z "${dispatcher}" || "${dispatcher}" == "--help" || "${dispatcher}" == "-h" || -z "$1" ]]; then
  echo "Usage: $0 <dispatcher> <target>"
  exit 1
fi

if [[ "$1" == *"+"* || "$1" == *"-"* ]]; then
  target="$1"
elif [[ "$1" =~ ^[0-9]+$ ]]; then
  target=$(( ( (curr_workspace - 1) / 10 ) * 10 + $1 ))
else
  target="$1"
fi

# Hyprland 0.55+ Lua mode: `hyprctl dispatch foo bar` is parsed as Lua
# `hl.dispatch(foo bar)` which is a syntax error. Use Lua dispatcher expressions.
case "$dispatcher" in
  workspace)
    hyprctl dispatch "hl.dsp.focus({workspace='${target}'})"
    ;;
  movetoworkspace)
    hyprctl dispatch "hl.dsp.window.move({workspace='${target}'})"
    ;;
  movetoworkspacesilent)
    hyprctl dispatch "hl.dsp.window.move({workspace='silent:${target}'})"
    ;;
  *)
    hyprctl dispatch "${dispatcher}" "${target}"
    ;;
esac
