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

link_file_or_dir() {
    SOURCE=$1
    DESTFILE=$2
    TO=$3

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
}

for FILE in `find -L . -maxdepth 1 -wholename './.*'`; do
    SOURCE="$PWD"/`basename $FILE`
    DESTFILE="$TO"/`basename $FILE`
    link_file_or_dir $SOURCE $DESTFILE $TO
done

DESTDIR="$TO/.config"
if [ ! -d $DESTDIR ]; then
    mkdir $DESTDIR
fi

for FILE in `find -L . -maxdepth 2 -wholename './config/*'`; do
    SOURCE="$PWD"/config/`basename $FILE`
    DESTFILE="$TO"/.config/`basename $FILE`

    link_file_or_dir $SOURCE $DESTFILE $TO/.config
done

POWERLEVEL9K='~/.powerlevel9k'
OHMYZSHCUSTOMTHEMES=".oh-my-zsh/custom/themes"
echo linking $POWERLEVEL9K into $OHMYZSHCUSTOMTHEMES
mkdir $OHMYZSHCUSTOMTHEMES
ln -siF ~/.powerlevel9k/ $OHMYZSHCUSTOMTHEMES/powerlevel9k
