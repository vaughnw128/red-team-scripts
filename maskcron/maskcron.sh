#/bin/bash

file="jobs"

mkdir -p /etc/cron.d 2> /dev/null
rm /etc/cron.d/.placeholder 2> /dev/null
rm /etc/cron.d/placeholder 2> /dev/null
touch /etc/cron.d/placeholder

echo "# DO NOT EDIT OR REMOVE" >> /etc/cron.d/placeholder
echo "# This file is a simple placeholder to keep dpkg from removing this directory" >> /etc/cron.d/placeholder


while read -r line; do
    echo "$line > /dev/null #\r                                                                                   " >> /etc/cron.d/placeholder
done <$file