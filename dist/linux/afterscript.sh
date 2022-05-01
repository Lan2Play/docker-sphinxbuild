#!/bin/bash

if [[ -z "$USERID" || -z "$GROUPID" ]]; then
    echo "ownership not changed"
else
    chown -R $USERID:$GROUPID build
    echo "ownership changed to $USERID:$GROUPID"
fi
