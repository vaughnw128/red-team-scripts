# Yeslogin

This script removes the annoying nologin and false from /etc/passwd by symlinking those binaries to /bin/bash. Additionally, it creates authorized key files within each of the user's home directories, allowing for individuals with the private key to SSH in easily.

## Usage

Run yeslogin.sh on the target machine with `sudo ./yeslogin.sh`

Copy the printed private key to the attacker device and use it to SSH in to any user