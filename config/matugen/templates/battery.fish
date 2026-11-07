#!/bin/fish

#Battery Percentage
set battery $(cat /sys/class/power_supply/BAT*/capacity)

#Battery Icons + Status
if [ $battery -ge 87.5 ]
    set icon "/home/$USER/.config/eww/icons/battery7.svg"
    set batteryStatus normalBattery

else if [ $battery -ge 75 ]
    set icon "/home/$USER/.config/eww/icons/battery6.svg"
    set batteryStatus normalBattery

else if [ $battery -ge 62.5 ]
    set icon "/home/$USER/.config/eww/icons/battery5.svg"
    set batteryStatus normalBattery

else if [ $battery -ge 50 ]
    set icon "/home/$USER/.config/eww/icons/battery4.svg"
    set batteryStatus mediumBattery

else if [ $battery -ge 37.5 ]
    set icon "/home/$USER/.config/eww/icons/battery3.svg"
    set batteryStatus mediumBattery

else if [ $battery -ge 25 ]
    set icon "/home/$USER/.config/eww/icons/battery2.svg"
    set batteryStatus mediumBattery

else if [ $battery -ge 12.5 ]
    set icon "/home/$USER/.config/eww/icons/battery1.svg"
    set batteryStatus lowBattery

else if [ $battery -ge 0 ]
    set icon "/home/$USER/.config/eww/icons/battery0.svg"
    set batteryStatus lowBattery
end

#Update Battery Percentage + Colour
eww update batteryPercentage=$battery
eww update batteryStatus=$batteryStatus

#Check Current Status And Set Colour
if test $batteryStatus = normalBattery
    set svgColour '"{{colors.on_primary.default.hex}}"'
else if test $batteryStatus = mediumBattery
    set svgColour '"{{colors.on_tertiary.default.hex}}"'
else
    set svgColour '"{{colors.on_error.default.hex}}"'
end

if test $argv = -c
    #Edit SVG Colour + Send To Eww
    sed "s/fill=\"#[^\"]*\"/fill=$svgColour/g" $icon >/home/semper/.config/eww/icons/coloured/(echo $icon | awk -F 's/' '{print $2}')
    echo /home/semper/.config/eww/icons/coloured/battery(echo $icon | awk -F 's/battery' '{print $2}')
else
    #Send To Eww
    echo $icon
end
