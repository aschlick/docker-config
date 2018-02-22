#!/usr/bin/env bash
/usr/bin/pulseaudio -D --system
/spotifyd/target/release/spotifyd -c /etc/spotifyd/spotifyd.conf
