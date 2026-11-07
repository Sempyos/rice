#!/bin/fish

switch $argv[1]
    case float
        niri msg action toggle-window-floating
    case overview
        niri msg action toggle-overview
    case workspace w
        niri msg action focus-workspace $argv[2]
    case center
        niri msg action center-column
    case fullscreen
        niri msg action maximize-column
    case battery power
        ewwii wc property-update --widget ent placeholder-text=$(cat /sys/class/power_supply/BAT*/capacity)%
        ewwii wc property-update --widget ent text=
        exit
    case brighter
        brightnessctl -q s 5%+
    case darker
        brightnessctl -q s 5%-
    case volume
        #Set Volume
        set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F ' ' '{print $2}')

        #Make It Pretty If Full
        if test $volume = 1.00
            set volume (echo $volume | tr -d '.')
        else
            set volume (wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk -F '.' '{print $2}')
        end
        ewwii wc property-update --widget ent placeholder=$volume%
        ewwii wc property-update --widget ent value=
        exit
    case louder
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
    case softer
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    case close
        ewwii close niriChip
    case fops
        ewwii wc property-update --widget ent placeholder=🦊
        ewwii wc property-update --widget ent value=
        exit
end

ewwii wc property-update --widget ent placeholder="Ask niri"
ewwii wc property-update --widget ent value=
