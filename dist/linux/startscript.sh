#!/bin/bash

/app/linux/prescript.sh

if [[ $Task =~ "make" ]]; then
    /app/linux/buildscript.sh
fi
if [[ $Task =~ "intl" ]]; then
    /app/linux/intlscript.sh
fi

/app/linux/afterscript.sh
