#!/bin/bash
# Script to automatically create dotfile symlinks

FROM="`dirname \`which $0\``"

if [[ -d "$1" ]]; then
	TO="$1"
else
	TO="$PWD"
fi

cd $FROM

echo "Symlinking files from $FROM to $TO"

for FILE in `find -L . -maxdepth 1 -wholename './.*'`; do
    SOURCE="$PWD"/`basename $FILE`
    DESTFILE="$TO"/`basename $FILE`

    if [[ "$DESTFILE" -ef "$SOURCE" ]]; then
        echo "skipping as it is already linked correctly $SOURCE"
        continue
    fi

    if [[ -d "$SOURCE" ]]; then
        DEST="$TO"
    else
        DEST="$DESTFILE"
    fi

    echo "Creating symlink from $SOURCE to $DESTFILE"
    ln -siF "$SOURCE" "$DEST"
    echo
done
