# Docker Boringtun

A simple image using to create and wireguard tunnel using BoringTun, an userspace implementation of Wireguard in Rust by Cloudflare

## Environment Variable

- **WG_LOG_LEVEL**: Log verbosity, possible values: silent, info, debug
- **WG_THREADS**: Number of OS threads to use

## Volumes

- `/etc/wireguard` configuration files location
