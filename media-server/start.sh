#!/bin/bash

pulseaudio -D --system --disallow-exit
roc-send -vv -s rtp+rs8m:0.0.0.0:10000 -r rs8m:0.0.0.0:10001 -d pulseaudio
  
