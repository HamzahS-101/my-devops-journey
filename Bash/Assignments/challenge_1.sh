#!/bin/bash

# This Bash script simulates a simple restaurant menu. 
# It welcomes the user, presents three food options (Burger, Pizza, Salad), and prompts them to enter a choice. 
# If the input is valid, it confirms the order; otherwise, it asks again until a valid option is chosen.

# Display a welcome message
echo "Welcome to Hamzah's Restaurant!"

# Show the menu options
echo "Please choose from the menu:"
echo "1. Burger"
echo "2. Pizza"
echo "3. Salad"

# Infinite loop to keep asking for a valid choice. Once a valid choice is entered, it will exit the loop.
while true; do
    read -p "Enter the number of your choice: " choice
    if [ $choice -eq 1 ]; then
        item="Burger"
        break
    elif [ $choice -eq 2 ]; then
        item="Pizza"
        break
    elif [ $choice -eq 3 ]; then
        item="Salad"
        break
    else
        echo "Invalid choice. Please select a valid menu Item"
    fi
done

# Confirm the order to the user
echo "You've ordered a $item. Enjoy!"