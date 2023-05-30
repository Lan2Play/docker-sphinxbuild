#!/bin/bash

if [[ $CACHE =~ "TRUE" ]]; then

    if [ -d "/cache" ]; then

        if [ ! -d "/cache/site-packages" ]; then
            mkdir -p /cache/site-packages
        fi

        if [ ! -d "/cache/bin" ]; then
            mkdir -p /cache/bin
        fi



        echo "caching pip..."

        sitepackagefolder=$( find $(find /usr/local/lib/ -name "python*" -type d) -name "site*" -type d )
        echo "sitepackagefolder found in $sitepackagefolder"

        if [ "$(ls -A /cache/site-packages)" ]; then
            echo "pip cache is already existent"
        else
            echo "pip cache is Empty, copy site packages"

            cp -rf $sitepackagefolder/* /cache/site-packages
            echo "pip cache copy complete"
        fi

        rm -rf $sitepackagefolder
        ln -s /cache/site-packages $sitepackagefolder


        echo "caching bin..."

        if [ "$(ls -A /cache/bin)" ]; then
            echo "bin cache is already existent"
        else
            echo "bin cache is Empty, copy bin"

            cp -rf /usr/local/bin/* /cache/bin
            echo "copy complete"
        fi

        rm -rf /usr/local/bin
        ln -s /cache/bin /usr/local/bin


    else
        echo "Warning: Cache Directory not found!"
    fi

fi


if test -f "requirements.txt"; then
    pip3 install -r requirements.txt
fi




