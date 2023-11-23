#!/usr/bin/bash

# ---
# Generates a simple README.md for Twitch stream folders.
# Will not overwrite an existing README.md.
#
# Usage: twitch_generate_readme.sh <folder> [<folder> ...]
# (You can use wildcards because of shell expansion.)
#
# e.g. twitch_generate_readme.sh *Gigaohm*
# ---

folders=()
while (( "$#" )); do
	folders+=("$1")
	echo Adding folder: "$1"
	shift
done

for ((i = 0; i < ${#folders[@]}; i++)); do
	base="${folders[$i]}"

	echo Processing: $base

    id="$(cut -d' ' -f1 <<< "$base")"
    IFS=',' read -r -a ids <<< "${id}"
    stream="$(echo $base | cut -d' ' -f4- | cut -d'[' -f1)"

    printf "\n id: $id \n stream: $stream \n\n"

    if test -f "${base}/README.md"; then
        printf "!!! - ${base}/README.md already exists. Skipping.\n\n"
        continue
    fi

    contents=""
    printf -v contents "${contents}# $stream\n\n"
    printf -v contents "${contents}## Streams\n"
    for u in ${ids[@]}; do
        url="- https://twitch.tv/videos/$u"
        echo "Generating stream link: $url"
        printf -v contents "${contents}- $url\n"
    done

    echo "${contents}" > "${base}/README.md"
done

