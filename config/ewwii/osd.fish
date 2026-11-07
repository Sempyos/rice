#!/bin/fish

#Check if the timeout exists, and if not, start it.
if test -z "$time"
    /home/semper/.config/eww/scripts/timeout.fish &
end

#Check If Window Is Open
if test (eww active-windows | awk -F 'pill: ' '{print $2}' | xargs) != pill
    eww update fullOSD=false
    eww open pill
end

#Update The Currently Shown Slider
eww update sliderSelector=$argv

#Update The Respective Slider
if test $argv = 1
    eww update currentBrightness=(brightnessctl -m -d amdgpu_bl1 | awk -F, '{print substr($4, 0, length($4)-1)}' | tr -d '%')
else
    eww update currentVolume=(~/.config/eww/scripts/volume.fish)
end
