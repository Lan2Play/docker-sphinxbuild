#!/bin/bash

if [[ $IntlLangs =~ "," ]]; then
    intlarray=`echo $IntlLangs | awk -F ',' '{ s = $1; for (i = 2; i <= NF; i++) s = s "\n"$i; print s; }'`

    for i in ${intlarray}
    do
        sphinx-intl update -p $IntlOut -l $i
    done

else
    sphinx-intl update -p $IntlOut -l $IntlLangs
fi

