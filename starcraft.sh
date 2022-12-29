#!/bin/bash

~/.wine/drive_c/Program\ Files\ \(x86\)/StarCraft/StarCraft.exe
xrandr --output $(xrandr | grep ' connected' | sed 's/ .*//' | head -n1) --mode 1920x1080
