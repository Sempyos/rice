#!/usr/bin/env fish

# Split the selection on tabs (in case of multiple files)
set selection (string split \t $selection)

# Take the first selected file
set file $selection[1]

# Notify full path
matugen --type scheme-vibrant image "$file"

