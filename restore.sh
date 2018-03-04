#!/usr/bin/env sh
set -ex

S3_PATH=$1
RESTORE_DIR="${RESTORE_DIR:-/restore}"
FILENAME=$(echo "$S3_PATH" | rev | cut -d"/" -f1 | rev)
DUMP_FILENAMES="${DUMP_FILENAMES}"

mkdir -p "$RESTORE_DIR"

s3cmd ${S3CMD_OPTIONS} --verbose --progress get "${S3_PATH}" "/tmp/$FILENAME"

TAR=$(echo "$FILENAME" | grep -e "\.tar\." -c )

if [ "$TAR" -eq 1 ]; then
    echo "TAR"
    7z x ${P7Z_OPTIONS} -so "/tmp/$FILENAME" | tar -x ${TAR_OPTIONS} -C "$RESTORE_DIR"
else
    7z x ${P7Z_OPTIONS} -o"$RESTORE_DIR" "/tmp/$FILENAME"
fi

if [ ! -z "$DUMP_FILENAMES" ]; then
    find $RESTORE_DIR
fi
