#!/bin/bash
set -eu

PICO_VOLUME="/Volumes/RPI-RP2/"
UF2FILE=$(find . -name '*.uf2')
FILE_COUNT=$(echo "$UF2FILE" | wc -l | xargs)

if [[ $FILE_COUNT -gt 1 ]]; then
    printf "ERROR: Found too many .uf2 files\n";
    echo "$UF2FILE";
    exit 0;
fi

if [[ $FILE_COUNT == 0 ]]; then
    echo "ERROR: Could not find .uf2 file, have you built your project?";
    exit 0;
fi

if [[ ! -d $PICO_VOLUME ]]; then
    echo "ERROR: Pico volume could not be found";
    exit 0;
fi

cp "$UF2FILE" $PICO_VOLUME

echo "$UF2FILE has been flashed to the Pico";
