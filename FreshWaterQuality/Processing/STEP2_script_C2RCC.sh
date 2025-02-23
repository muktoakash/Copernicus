#!/bin/bash

output_folder=./script_out/
metData=../HYDR02_FreshWaterQuality_Trasimeno/HYDR02_FreshWaterQuality_Trasimeno/AuxData/Met_aux.csv
paramFile=./c2rcc_param.xml
oldEnd=.dim
newEnd=_C2RCC.dim

for i in $(ls -d -1 ./Output/*.dim)
do
    name=$(basename $i)
    idate=$(basename $i | cut -d '_' -f 4 | cut -d 'T' -f 1)
    ozone=$(grep -F $idate $metData | cut -d ',' -f 2)
    press=$(grep -F $idate $metData | cut -d ',' -f 3)
    temp=$(grep -F $idate $metData | cut -d ',' -f 4)
    gpt c2rcc.msi -SsourceProduct=$i -p $paramFile -Pozone=$ozone -Ppress=$press -Ptemperature=$temp -t $output_folder${name%$oldEnd}$newEnd
done