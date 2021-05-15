#!/bin/bash

OLDFONT='"Source Sans Pro", "Source Han Sans SC"'

NEWFONT='"Meiryo"                               '
#NEWFONT='"UD Digi Kyokasho NP-B"                '
#NEWFONT='"UD Digi Kyokasho NP-R"                '
#NEWFONT='"BIZ UDPGothic"                        '
#NEWFONT='"BIZ UDPMincho"                        '
#NEWFONT='"MS Gothic"                            '
#NEWFONT='"MS Mincho"                            '
#NEWFONT='"Yu Gothic"                            '
#NEWFONT='"Yu Mincho"                            '

echo

if [ ${#OLDFONT} -ne ${#NEWFONT} ]; then
    echo ERROR: Inconsistent lengths of font strings
    ./gsar -s"${OLDFONT}" -r"${NEWFONT}" -B
    exit 1
fi

if [ -f ORIG.asar ]; then
    ./gsar -f -s"${OLDFONT}" -r"${NEWFONT}" ORIG.asar app.asar
else
    echo ERROR: Cannot find '"ORIG.asar"'
fi
