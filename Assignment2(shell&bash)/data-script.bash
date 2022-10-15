#!/bin/bash

### Extract headers
head -1 NCBirths2004.csv > 'headers.txt'

### Extract and sort the weights of smokers and nonsmokers
smoker_list=`cat NCBirths2004.csv | cut -d ',' -f 6,8 | grep 'Yes' | cut -d ',' -f 1 | sort -n`
nonsmoker_list=`cat NCBirths2004.csv | cut -d ',' -f 6,8 | grep 'No' | cut -d ',' -f 1 | sort -n`

### Count numbers of smokers and nonsmokers
num_smoker=`echo ${smoker_list[@]} | wc -w`
num_nonsmoker=`echo ${nonsmoker_list[@]} | wc -w`

### Print Numbers to Stdout
str_num_smoker=`echo $num_smoker`
str_num_nonsmoker=`echo $num_nonsmoker`
printf "The number of smokers is ${str_num_smoker}.\n"
printf "The number of nonsmokers is ${str_num_nonsmoker}.\n"

### Compute median of weights among smokers
if ((`expr $num_smoker % 2`))
then
    temp=`expr $num_smoker / 2`
    temp=`expr $temp + 1`
    echo ${smoker_list[@]} | cut -d ' ' -f $temp > smoker_yes_med.txt
else
    temp1=`expr $num_smoker / 2`
    temp2=`expr $temp1 + 1`
    temp3=`echo ${smoker_list[@]} | cut -d ' ' -f $temp1`
    temp4=`echo ${smoker_list[@]} | cut -d ' ' -f $temp2`
    temp5=`expr $temp3 + $temp4`
    temp6=`expr $temp5 / 2`
    echo $temp6 > smoker_yes_med.txt
fi

### Compute median of weights among nonsmokers
if ((`expr $num_nonsmoker % 2`))
then
    temp=`expr $num_nonsmoker / 2`
    temp=`expr $temp + 1`
    echo ${nonsmoker_list[@]} | cut -d ' ' -f $temp > smoker_no_med.txt
else
    temp1=`expr $num_nonsmoker / 2`
    temp2=`expr $temp1 + 1`
    temp3=`echo ${nonsmoker_list[@]} | cut -d ' ' -f $temp1`
    temp4=`echo ${nonsmoker_list[@]} | cut -d ' ' -f $temp2`
    temp5=`expr $temp3 + $temp4`
    temp6=`expr $temp5 / 2`
    echo $temp6 > smoker_no_med.txt
fi

### The median of weights among nonsmokers is less than that among smokers
