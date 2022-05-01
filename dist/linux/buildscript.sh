#!/bin/bash

if [[ $MakeCommands =~ "," ]]; then
    makearray=`echo $MakeCommands | awk -F ',' '{ s = $1; for (i = 2; i <= NF; i++) s = s "\n"$i; print s; }'`

    for i in ${makearray}
    do
        make $i
    done

else
    make $MakeCommands
fi
