#!/bin/bash

# Neat bash one-liner demonstrating input redirection wiht great clarity.
# Source: https://superuser.com/a/253468
# PURPOSE: list all packages installed manually by user by distilling:
# - initial package set
# - all packages installed with apt package manager
# - all packages "automatically" installed by apt package manager (to reduce to
# manual)
# - exclude all "linux-" packages (libraries that could be filtered by system
# time but I'm lazy)

comm -13 \
  <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort) \
  <(comm -23 \
    <(dpkg-query -W -f='${Package}\n' | sed 1d | sort) \
    <(apt-mark showauto | sort) \
  ) | grep -v "^linux-"
