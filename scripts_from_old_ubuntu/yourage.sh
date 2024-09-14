#!/bin/bash
current_year=`date +%Y`
read -p "Enter your birth year: " birth_year
echo "You are" $(expr "$current_year" - "$birth_year") "y.o."
