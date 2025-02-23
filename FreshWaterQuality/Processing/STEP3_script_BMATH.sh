#!/bin/bash

output_folder1=./step3_script_out/R705_R665/
output_folder2=./step3_script_out/MCI/
output_folder1=./step3_script_out/R705_R665/
output_folder2=./step3_script_out/MCI/
oldEnd=_C2RCC.dim
newEnd1=_R705_R665.tif
newEnd2=_MCI.tif

for i in $(ls -d -1 ./script_out/*.dim)
for i in $(ls -d -1 ./script_out/*.dim)
do
    name=$(basename $i)
    output1=$output_folder1${name%$oldEnd}$newEnd1
    output2=$output_folder2${name%$oldEnd}$newEnd2
    gpt ./secondGraph.xml -PInput=$i -POutput1=$output1 -POutput2=$output2
done
