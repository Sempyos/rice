function fish_right_prompt --description 'Write out the prompt'

    set -l battery (cat /sys/class/power_supply/BAT*/capacity)
    set -l batteryStatus (cat /sys/class/power_supply/BAT*/status)

    set surface_container_highest '{{colors.surface_container_highest.default.hex}}'
    set surface_container_high '{{colors.surface_container_high.default.hex}}'
    set on_surface '{{colors.on_surface.default.hex}}'
    set error '{{colors.error.default.hex}}'
    set secondary '{{colors.secondary.default.hex}}'

    #Battery Icons + Status
    if [ $battery -ge 90 ]
        set icon 󰁹
    else if [ $battery -ge 80 ]
        set icon 󰂂
    else if [ $battery -ge 70 ]
        set icon 󰂁
    else if [ $battery -ge 60 ]
        set icon 󰂀
    else if [ $battery -ge 50 ]
        set icon 󰁿
    else if [ $battery -ge 40 ]
        set icon 󰁾
    else if [ $battery -ge 30 ]
        set icon 󰁽
    else if [ $battery -ge 20 ]
        set icon 󰁼
    else if [ $battery -ge 10 ]
        set icon 󰁻
    else if [ $battery -ge 0 ]
        set icon 󰁺
    end

    if [ $batteryStatus = Charging ]
        set icon 󱐋
    end

    if [ $battery -le 20 ]
        set icon (set_color $error)$icon
    else

    end
    echo -n -s (set_color $surface_container_high) \
        (set_color -b $surface_container_high) (set_color $on_surface) (date +%m/%d)" "(set_color -b $surface_container_high)(set_color $surface_container_highest)(set_color -b $surface_container_highest)(set_color $secondary)$icon" "$battery"%"(set_color normal)(set_color $surface_container_highest)(set_color normal)
end
# (set_color -b $surface_container_high)(set_color $surface_container_highest)(set_color -b $surface_container_highest)(set_color $secondary) (hostnamectl hostname)(set_color $surface_container_highest)(set_color -b $surface_container_high)
