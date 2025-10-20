#!/bin/bash
# @author Allen, Gemini 2.5 Flash
# @since 2025
# volume-light-status: Generates brightness, speaker, and microphone status for i3blocks.
# WARN: Dependencies: brightnessctl, wpctl, bc

# --- Helper Function to select Speaker Icon based on percentage ---
get_sink_icon() {
    VOLUME=$1
    if [ "$VOLUME" -le 33 ]; then
        echo ""
    elif [ "$VOLUME" -le 66 ]; then
        echo ""
    else
        echo ""
    fi
}

# --- Helper Function to select Brightness Icon based on percentage ---
get_light_icon() {
    BRIGHTNESS_INT=$1
    if [ "$BRIGHTNESS_INT" -le 10 ]; then
        echo "󰃞"
    elif [ "$BRIGHTNESS_INT" -le 40 ]; then
        echo "󰃝"
    elif [ "$BRIGHTNESS_INT" -le 70 ]; then
        echo "󰃟"
    else
        echo "󰃠"
    fi
}

# --- 1. Get Brightness ---
BRIGHTNESS_PERCENT=$(brightnessctl -m | awk -F, '{print $4}' | tr -d '%')
BRIGHTNESS_ICON=$(get_light_icon "$BRIGHTNESS_PERCENT")

# --- 2. Get Speaker Volume Status ---
SINK_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if echo "$SINK_STATUS" | grep -q 'MUTED'; then
    SINK_VOLUME="MUTE"
    SINK_ICON="󰝟"
else
    SINK_VOLUME_FACTOR=$(echo "$SINK_STATUS" | grep -oE '[0-9]+\.[0-9]+')
    SINK_VOLUME_INT=$(echo "$SINK_VOLUME_FACTOR * 100" | bc | awk '{print int($1)}')
    SINK_VOLUME="$SINK_VOLUME_INT"
    SINK_ICON=$(get_sink_icon "$SINK_VOLUME_INT")
fi

# --- 3. Get Microphone Volume Status ---
SOURCE_STATUS=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)

if echo "$SOURCE_STATUS" | grep -q 'MUTED'; then
    SOURCE_VOLUME="MUTE"
    SOURCE_ICON=" "
else
    SOURCE_VOLUME_FACTOR=$(echo "$SOURCE_STATUS" | grep -oE '[0-9]+\.[0-9]+')
    SOURCE_VOLUME_INT=$(echo "$SOURCE_VOLUME_FACTOR * 100" | bc | awk '{print int($1)}')
    SOURCE_VOLUME="$SOURCE_VOLUME_INT"
    SOURCE_ICON=""
fi

# --- 4. Output the final string for i3blocks ---
SINK_DISPLAY="${SINK_VOLUME}%"
SOURCE_DISPLAY="${SOURCE_VOLUME}%"
# echo "'$SOURCE_DISPLAY'"

if [ "$SINK_VOLUME" == "MUTE" ]; then
    # SINK_DISPLAY="MUTE"
    SINK_DISPLAY=""
fi
if [ "$SOURCE_VOLUME" == "MUTE" ]; then
    # SOURCE_DISPLAY="MUTE"
    SOURCE_DISPLAY=""
fi

echo "[$BRIGHTNESS_ICON $BRIGHTNESS_PERCENT% $SINK_ICON $SINK_DISPLAY $SOURCE_ICON$SOURCE_DISPLAY]"
