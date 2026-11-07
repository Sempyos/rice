#!/bin/fish
switch $ORIENTATION
    case normal 90 inverted 270
        pkill -x lisgd
        switch $ORIENTATION
            case normal
                set o 0
            case 90
                set o 1
            case inverted
                set o 2
            case 270
                set o 3
        end
        /home/semper/lisgd/lisgd -o $o &
end
