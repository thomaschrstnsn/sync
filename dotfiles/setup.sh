#!/bin/sh
# Script to automatically create dotfile symlinks

FROM="`dirname \`which $0\``"

if [[ -d "$1" ]]; then
	TO="$1"
else
	TO="$PWD"
fi

cd $FROM

echo "Symlinking files from '$FROM' to '$TO'"

for FILE in `find -L . -maxdepth 1 -wholename './.*'`; do
    SOURCE="$FROM"/`basename $FILE`

    if [[ -d "$FILE" ]]; then
        DEST="$TO"
    else
        DEST="$TO"/`basename $FILE`
    fi

    echo "Creating symlink to $FILE"
    echo

    ln -siF "$SOURCE" "$DEST"
done
