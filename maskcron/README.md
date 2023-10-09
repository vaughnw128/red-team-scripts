# Cron masker

This script masks cronjobs by putting them in a normally empty file within cron.d, and then obfuscates the entries with a return and lots of spaces. It additionally silences all cronjob logs by editing it's service file, and silences pam.d's auth log to the cron service logs. This script will be very useful for burying persistent jobs and effectively hiding them from the blue team.

## Usage

1. Add cronjobs in normal cron format with user specified in the 'jobs' file ex: `* * * * * root touch /home/user/test`
2. Run script as root on target system