#!/bin/sh

mkdir -p /var/log/zfsbackup

pre_command_flags="--logLevel warning --jsonOutput"

if [ -n "$PGP_PUBLIC_KEY" ]; then
  pre_command_flags="$pre_command_flags --publicKeyRingPath $PGP_PUBLIC_KEY"
fi
if [ -n "$PGP_SECRET_KEY" ]; then
  pre_command_flags="$pre_command_flags --secretKeyRingPath $PGP_SECRET_KEY"
fi
if [ -n "$PGP_EMAIL" ]; then
  pre_command_flags="$pre_command_flags --signFrom $PGP_EMAIL --encryptTo $PGP_EMAIL"
fi

command="$1 $pre_command_flags"
shift 1
command="$command $@"

exec /usr/local/bin/zfsbackup-go $command > /var/log/zfsbackup/result.json 2> /var/log/zfsbackup/errors.txt
