#!/bin/fish

set count 0

for f in /usr/share/applications/*
    if string match -rq 'avahi|autorun|bssh|bvnc|fnott|gcr|geoclue|google|java|jconsole|jshell|openstreetmap|Xwayland|mimeinfo|Zenity|OnlineAccounts|Evolution|evolution|pinentry|kde|opensc|qv4l2|qvidcap|user-dirs|wheelmap|xdg' $f
        continue
    end
    # if test (math "$count % 10") -eq 0
    # set buf "$buf (box :space-evenly false :orientation \"v\""
    # end

    set icon (fd (cat $f | awk -F 'Icon=' '{print $2}' | xargs) '/usr/share/icons/hicolor/' '/usr/local/share/pixmaps' '/usr/share/pixmaps' -E symbolic | grep -vi 'devel' | sort -t '/' -k 6 -V | tail -n 1)
    set name (basename $f)
    echo $name
    # set buf "$buf (imageButtonWH :width \"64\" :height \"64\" :cmd \"gtk-launch $name & disown\" :class \"desktopIcon\" :path \"$icon\")"
    set count (math $count + 1)

    # if test (math "$count % 10") -eq 0
    # set buf "$buf)"
    # end
end

# close last column if incomplete
# if test (math "$count % 10") -ne 0
# set buf "$buf)"
# end

echo $buf
