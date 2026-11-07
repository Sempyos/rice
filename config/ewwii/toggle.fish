#!/bin/fish

if test (ewwii wc property-get --widget "reva" reveal-child) = false
    ewwii wc property-update --widget reva reveal=true
else
    ewwii wc property-update --widget reva reveal=false
end
