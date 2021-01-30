#!/usr/bin/env bash

set -e

declare -r WG_INTERFACE=${1:-wg0}

function infinite_loop() {
  # Handle shutdown behavior
  trap 'shutdown_wg "$1"' SIGTERM SIGINT SIGQUIT

  sleep infinity &
  wait $!
}

function shutdown_wg() {
  echo "Shutting down Wireguard (boringtun)"
  wg-quick down "$1"
  exit 0
}

function start_wg() {
  echo "Starting up Wireguard (boringtun)"
  wg-quick up "$1"
  infinite_loop "$1"
}

#if [[ "$1" =~ ^wg.*$ ]]; then
if [ -f "/etc/wireguard/${WG_INTERFACE}.conf" ]; then
  start_wg ${WG_INTERFACE}
else
  exec "$@"
fi
