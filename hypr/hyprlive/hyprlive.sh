#!/bin/bash

reset () {
  killall hyprpaper && hyprpaper & disown
}



for backnum {0..24}
do

