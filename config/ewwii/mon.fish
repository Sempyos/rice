#!/usr/bin/env fish

busctl --user monitor \
    --match="type='method_call',interface='org.freedesktop.Notifications',member='Notify'" \
    --json=short |
    jq --unbuffered -r '.payload.data[0], .payload.data[3], .payload.data[4]' |
    while read -l app
        read -l summary
        read -l body

        echo "App: $app"
        echo "Summary: $summary"
        echo "Body: $body"

        ewwii update show=true
        ewwii update app=$app
        ewwii update summary=$summary
        ewwii update body=$body

        sleep 4

        ewwii update show=false

    end
