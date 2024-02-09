#!/usr/bin/bash

# ---
# Given my normal naming scheme, creates a properly named folder, 
# moves the vtt into it and renames everything.
# 
# Normally something like: 
# - <twitchId> - name [gigaohmbiological - <date>].vtt
# - <twitchId>,<twitchId22> - name [gigaohmbiological - <date>].vtt
#
# Need to change it to something like:
# - <twitchId> (<date>) - name.vtt
# ---

files=()
while (( "$#" )); do
	files+=("$1")
	echo Adding file: "$1"
	shift
done

for ((i = 0; i < ${#files[@]}; i++)); do
    suffix=""
    file="${files[$i]}"

    echo processing: $file

    base="${file%.*}"
    [[ "$base" =~ .*"fixed"$ ]] && base="${base%.*}" && suffix=".fixed"
    [[ "$base" =~ .*"joined"$ ]] && base="${base%.*}" && suffix=".joined"

    id="$(cut -d' ' -f1 <<< "$base")"
    date="$(echo $base | cut -d'[' -f2 | cut -d']' -f1 | cut -d' ' -f3)"
    
    stream="$(echo $base | cut -d' ' -f3- | cut -d'[' -f1)"
    # Strip unnecessary dettails.
    stream="${stream/"-- Brief "/""}"
    # Trim trailing spaces
    stream="${stream%"${stream##*[![:space:]]}"}"

	folder="${id} (${date}) - ${stream}"
	target="${folder}${suffix}.vtt"

    [ ! -d "${folder}" ] && mkdir -v "${folder}"
    mv -vi "${file}" "${folder}/${target}"
    echo

    # printf "\n base: $base \n date: $date \n id: $id \n stream: $stream \n"
    # printf " folder: $folder \n target: $target \n\n"

done

