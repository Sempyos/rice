#!/bin/fish

#Set Volume
set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $2}')
set brightness (brightnessctl -m -d amdgpu_bl1 | awk -F, '{print substr($4, 0, length($4)-1)}' | tr -d '%')

#Make It Pretty If Full
if test $volume = 1.00
    set volume (echo $volume | tr -d '.')
else
    set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '.' '{print $2}')
end

ewwii wc property-update --widget bri value=$brightness
ewwii wc property-update --widget vol value=$volume

# notify-send $brightness
