#!/usr/bin/env bash
# make sure line endings are LF
/bin/echo "running spotifyd"
/spotifyd/target/release/spotifyd -c /etc/spotifyd/spotifyd.conf --no-daemon
