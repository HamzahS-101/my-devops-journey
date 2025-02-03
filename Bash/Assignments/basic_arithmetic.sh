#!/bin/bash

# Prompt user for two numbers

read -p "Enter the first number: " num1
read -p "Enter the second number: " num2

# Perform Calculations

add=$((num1 + num2))
subtract=$((num1 - num2))
multiply=$((num1 * num2))
divide=$((num1 / num2))

# Display Results

echo "Addition = $add"
echo "Subtraction = $subtract"
echo "Multiply = $multiply"
echo "Divide = $divide"
