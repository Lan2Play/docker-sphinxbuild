#!/bin/bash

if test -f "requirements.txt"; then
    pip3 install -r requirements.txt
fi

if [[ $MakeCommands =~ "," ]]; then
    readarray -td '' makearray < <(awk '{ gsub(/, /,"\0"); print; }' <<<"$MakeCommands, "); unset 'makearray[-1]';
    declare -p makearray;

    for i in "${makearray[@]}"
    do
    :
    make $i
    done

else
    make $MakeCommands
fi


if [[ -z "$USERID" || -z "$GROUPID" ]]; then
    echo "ownership not changed"
else
    chown -R $USERID:$GROUPID build
    echo "ownership changed to $USERID:$GROUPID"
fi
