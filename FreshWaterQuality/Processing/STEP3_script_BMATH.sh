#!/bin/bash

output_folder1=/shared/Training/HYDR02_FreshWaterQuality_Trasimeno/Processing/R705_R665/
output_folder2=/shared/Training/HYDR02_FreshWaterQuality_Trasimeno/Processing/MCI/
oldEnd=_C2RCC.dim
newEnd1=_R705_R665.tif
newEnd2=_MCI.tif

for i in $(ls -d -1 /shared/Training/HYDR02_FreshWaterQuality_Trasimeno/Processing/C2RCC/*.dim)
do
    name=$(basename $i)
    output1=$output_folder1${name%$oldEnd}$newEnd1
    output2=$output_folder2${name%$oldEnd}$newEnd2
    gpt /shared/Training/HYDR02_FreshWaterQuality_Trasimeno/Processing/STEP3_Graph_BMath.xml -PInput=$i -POutput1=$output1 -POutput2=$output2
done
