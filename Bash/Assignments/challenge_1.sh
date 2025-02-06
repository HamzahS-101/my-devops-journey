#!/bin/bash

# This Bash script simulates a simple restaurant menu. 
# It welcomes the user, presents three food options (Burger, Pizza, Salad), and prompts them to enter a choice. 
# If the input is valid, it confirms the order; otherwise, it asks again until a valid option is chosen.

# Display a welcome message
echo "Welcome to Hamzah's Restaurant!"
echo 

# Show the menu options
echo "Please choose a main meal option from the menu:"
echo "1. Burger"
echo "2. Pizza"
echo "3. Salad"
echo 
# Infinite loop to keep asking for a valid choice. Once a valid choice is entered, it will exit the loop.
while true; do
    read -p "Enter the number of your choice: " main
    echo
    if [ $main -eq 1 ]; then
        item="Burger"
        break
    elif [ $main -eq 2 ]; then
        item="Pizza"
        break
    elif [ $main -eq 3 ]; then
        item="Salad"
        break
    else
        echo "Invalid choice. Please select a valid menu Item"
    fi
done

# Confirm the main meal to the user
echo "You've ordered a "$item" as your main meal."
echo

# Show the drink options
echo "Now select a drink you would like to accompany your "$item":"
echo "1. Milkshake"
echo "2. Fruit Juice"
echo "3. Water"
echo 

# Infinite loop to keep asking for a valid choice. Once a valid choice is entered, it will exit the loop.
while true; do
    read -p "Enter the number of your choice: " drink
    echo
    if [ $drink -eq 1 ]; then
        item2="Milkshake"
        break
    elif [ $drink -eq 2 ]; then
        item2="Fruit Juice"
        break
    elif [ $drink -eq 3 ]; then
        item2="bottle of Water"
        break
    else
        echo "Invalid choice. Please select a valid menu Item"
    fi
done

# Confirm the drink to the user
echo "You've ordered a "$item2" as your drink. Great choice!"
echo 
# Complete the order
echo "Here's your complete order:"
echo "Main Meal: "$item""
echo "Drink: "$item2""
echo 
echo "Thank you for dining with us. We hope you enjoy your meal!"