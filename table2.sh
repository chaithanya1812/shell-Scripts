#!/bin/bash
set -ne
red="\e[31m"
name="\033[36;40;4m"
green="\e[32m"
normal="\e[0m"
echo -ne  "${name} Enter the table number:: ${normal}"
read table
echo  -ne  "${name} Enter the table-last-digit number:: ${normal}"
read last
echo -e  "${green}-----------------"
i=0
while [ $i -le $last ]; do
        echo "$table * $i = $[ $table * $i]"
        i=$(( $i + 1))
done
echo -e "-----------------${normal}"
