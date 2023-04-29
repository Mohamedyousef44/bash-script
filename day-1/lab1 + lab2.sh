#! /bin/bash

# parameters

## num1 -> float
## num2 -> float

# exit codes

## 0: success
## 1: number of parameters not valid
## 2: parameters not float type


# check if user input two varaibles
[ ${#} -ne 2 ] && exit 1

num1=${1}
num2=${2}

# check if num1 is float
[ ! $num1=^[-+]?[0-9]*\.[0-9]*$ ] && exit 2

# check if num2 is float
[ ! $num2=^[-+]?[0-9]*\.[0-9]*$ ] && exit 2

echo "your numbers are ${num1} , ${num2}"
echo "sum of two nums is : "
echo "${num1} + ${num2}" | bc 
echo "mul of two nums is :"
echo "${num1} * ${num2}" | bc
exit 0