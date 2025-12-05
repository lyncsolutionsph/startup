#!/bin/bash


LOGFILE="/var/log/startup-commands.log"


log() {
   echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$LOGFILE"
}


run_cmd() {
   CMD="$1"
   DESC="$2"
   if eval "$CMD"; then
       log "SUCCESS: $DESC"
   else
       log "ERROR: $DESC"
   fi
}


log "=== Startup Script Begin ==="

run_cmd "systemctl restart NetworkManager" "Restarting NetworkManager"
run_cmd "systemctl restart nftables" "Restarting nftables"
run_cmd "systemctl restart dnsmasq" "Restarting dnsmasq"
