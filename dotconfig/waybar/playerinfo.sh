#! /bin/bash

#text=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)
#wanted_state="Playing"
#maxlength=35
#text=$($HOME/.config/waybar/media_scroll.sh)
# if the text is longer than the max length, truncate it and add "..."
#if [ ${#text} -gt $maxlength ]; then
#    text=${text:0:$maxlength-3}"..."
#fi

#!/bin/bash
IFS=""
function slice_loop () { ## grab a slice of a string, and if you go past the end loop back around
    local str="$1"
    local start=$2
    local how_many=$3
    local len=${#str};

    local result="";

    for ((i=0; i < how_many; i++))
    do
        local index=$(((start+i) % len)) ## Grab the index of the needed char (wrapping around if need be)
        local char="${str:index:1}" ## Select the character at that index
        local result="$result$char" ## Append to result
    done

    echo -n $result
}

#msg=$;
begin=0
Work_text=$text;
while :
do
state=$(playerctl status 2>&1);
text=$(playerctl metadata --format '{{artist}} - {{title}}' 2>/dev/null)
case $state in 

    "Playing")
        if [ "$Work_text" != "$text" ]; then
            Work_text=$text;
	        begin=0;
        fi
        slice=$(slice_loop "$Work_text | " $begin 20);
        #echo -ne "\r";
        #echo -n $slice;
        playerctl metadata --format '{"text": "'" $slice"'", "tooltip": "{{playerName}} : {{artist}} - {{title}}"}'
        echo -ne "              \r";
        sleep 0.2;
        ((begin=begin+1));
        ;;
    "Paused")
        if [ ${#text} -gt 20 ]; then
            text=${text:0:20}
        fi
        #echo -ne "\r";
        #echo -n $slice;
        playerctl metadata --format '{"text": "'" $text"'", "tooltip": "{{playerName}} : {{artist}} - {{title}}"}'
        echo -ne "              \r";
        sleep 0.2;
        ;;
    "Stopped")
        text="No music Playing"
        #echo -ne "\r";
        #echo -n $slice;
        playerctl metadata --format '{"text": "'"◼️ $text"'", "tooltip": "{{playerName}} : {{artist}} - {{title}}"}'
        echo -ne "              \r";
        sleep 0.2;
        ;;

    *)
        text="No Player found"
        #echo -ne "\r";
        #echo -n $slice;
        echo '{"text": "'"◼️ $text"'", "tooltip": "Nothing playing right now"}'
        echo -ne "              \r";
        sleep 0.2;
        ;;
esac
done


#playerctl metadata --format '{"text": "'"$text"'", "tooltip": "{{playerName}} : {{artist}} - {{title}}"'
