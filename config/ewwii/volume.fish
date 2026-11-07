#!/bin/fish

#Set Volume
set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $2}')

#Make It Pretty If Full
if test $volume = 1.00
    set volume (echo $volume | tr -d '.')
else
    set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '.' '{print $2}')
end

#Return to Eww
echo $volume
