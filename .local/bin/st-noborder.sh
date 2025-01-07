#!/bin/bash

time_start=$(date +"%s")

xrdb -merge <<< "st.borderpx: 5" && kill -USR1 $(pidof st)
# nvim "$@"
"$@"
xrdb -merge <<< "st.borderpx: 20" && kill -USR1 $(pidof st)

time_end=$(date +"%s")
toc=$((time_end - time_start))

# [ "$toc" -ge 86400 ] && echo "\033[1;31mtook too long..." && exit
[ "$toc" -ge 86400 ] && echo "took too long..." && exit
[ "$toc" -le 5 ] && exit;

# echo "\033[1;32mtook:\033[0m $(date -ud @$toc +'%Hh %Mm %Ss')"
echo "took: $(date -ud @$toc +'%Hh %Mm %Ss')"
