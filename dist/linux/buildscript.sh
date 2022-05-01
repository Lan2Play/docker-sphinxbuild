#!/bin/bash

if test -f "requirements.txt"; then
    pip3 install -r requirements.txt
fi

if [[ $MakeCommands =~ "," ]]; then
    makearray=`echo $MakeCommands | awk -F ',' '{ s = $1; for (i = 2; i <= NF; i++) s = s "\n"$i; print s; }'`

    for i in ${makearray}
    do
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
