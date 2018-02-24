#!/usr/bin/env bash
# make sure line endings are LF
/bin/echo "starting dbus"
/etc/init.d/dbus start
/bin/echo "starting avahi"
/etc/init.d/avahi-daemon start
/bin/echo "starting pulse"
/usr/bin/pulseaudio -D --system
/bin/echo "running spotifyd"
/spotifyd/target/release/spotifyd -c /etc/spotifyd/spotifyd.conf --no-daemon
