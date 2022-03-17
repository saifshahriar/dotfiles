#!/bin/sh
ls /sys/firmware/efi/efivars
echo "press ctrl+c after pinging sometime"
ping saifshahriar.github.io
timedatectl set-ntp true
timedatectl status
sleep 5s
cfdisk
