#!/bin/fish

set rssi (nmcli -f IN-USE,SIGNAL device wifi | awk -F '*' '{print $2}' | xargs)

if test $rssi -ge 75
    set icon "/home/semper/Downloads/wifi_32dp_E3E3E3_FILL0_wght400_GRAD0_opsz40 (1).svg"
else if test $rssi -ge 50
    set icon "/home/semper/Downloads/wifi_2_bar_32dp_E3E3E3_FILL0_wght400_GRAD0_opsz40.svg"
else if test $rssi -ge 25
    set icon "/home/semper/Downloads/wifi_1_bar_32dp_E3E3E3_FILL0_wght400_GRAD0_opsz40.svg"
else
    set icon "/home/semper/Downloads/wifi_off_32dp_E3E3E3_FILL0_wght400_GRAD0_opsz40.svg"
end

echo $icon
