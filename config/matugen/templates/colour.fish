#!/bin/fish
set svgColour '"{{colors.on_primary.default.hex}}"'
sed "s/fill=\"#[^\"]*\"/fill=$svgColour/g" /home/semper/.config/eww/icons/brightness.svg >/home/semper/.config/eww/icons/coloured/brightness.svg
sed "s/fill=\"#[^\"]*\"/fill=$svgColour/g" /home/semper/.config/eww/icons/volume.svg >/home/semper/.config/eww/icons/coloured/volume.svg
