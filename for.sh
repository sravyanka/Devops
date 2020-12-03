#!/bin/sh
clear
read -p "Enter a number: " num
for((i=0;i<=num;i=i+1)); do 
	echo "I'm in iteration: $i"
done

