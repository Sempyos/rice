#!/bin/fish

#Battery Percentage
set battery $(cat /sys/class/power_supply/BAT*/capacity)
set bstatus $(cat /sys/class/power_supply/BAT*/status)

#Battery Icons + Status
if [ $battery -ge 87.5 ]
    set icon "/home/$USER/.config/eww/icons/battery7.svg"
    set batteryStatus normalBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat mediumBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 75 ]
    set icon "/home/$USER/.config/eww/icons/battery6.svg"
    set batteryStatus normalBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat mediumBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 62.5 ]
    set icon "/home/$USER/.config/eww/icons/battery5.svg"
    set batteryStatus normalBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat mediumBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 50 ]
    set icon "/home/$USER/.config/eww/icons/battery4.svg"
    set batteryStatus mediumBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat normalBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 37.5 ]
    set icon "/home/$USER/.config/eww/icons/battery3.svg"
    set batteryStatus mediumBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat normalBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 25 ]
    set icon "/home/$USER/.config/eww/icons/battery2.svg"
    set batteryStatus mediumBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat normalBattery >/dev/null
    ewwii wc remove-class --widget bat lowBattery >/dev/null

else if [ $battery -ge 12.5 ]
    set icon "/home/$USER/.config/eww/icons/battery1.svg"
    set batteryStatus lowBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat normalBattery >/dev/null
    ewwii wc remove-class --widget bat mediumBattery >/dev/null

else if [ $battery -ge 0 ]
    set icon "/home/$USER/.config/eww/icons/battery0.svg"
    set batteryStatus lowBattery
    ewwii wc add-class --widget bat $batteryStatus >/dev/null
    ewwii wc remove-class --widget bat normalBattery >/dev/null
    ewwii wc remove-class --widget bat mediumBattery >/dev/null

end

#Update Battery Percentage + Colour
ewwii wc property-update --widget bat fraction=(printf "%.2f" (math "min(1, $battery / 100)")) >/dev/null

#Check Current Status And Set Colour
if test $batteryStatus = normalBattery
    set svgColour '"#4b007e"'
else if test $batteryStatus = mediumBattery
    set svgColour '"#4a2244"'
else
    set svgColour '"#690005"'
end

if test $bstatus = Charging
    set icon "/home/semper/.config/ewwii/electric_bolt_32dp_E3E3E3_FILL1_wght400_GRAD0_opsz40.svg"
    sed "s/fill=\"#[^\"]*\"/fill=$svgColour/g" $icon >/home/semper/.config/eww/icons/coloured/bolt.svg
    set icon /home/semper/.config/eww/icons/coloured/bolt.svg
else
    sed "s/fill=\"#[^\"]*\"/fill=$svgColour/g" $icon >/home/semper/.config/eww/icons/coloured/(echo $icon | awk -F 's/' '{print $2}')
    set icon /home/semper/.config/eww/icons/coloured/battery(echo $icon | awk -F 's/battery' '{print $2}')
end

#Edit SVG Colour + Send To Eww
echo $icon
