#!/bin/bash
read -p "Enter first value: " x
read -p "Enter second value: " y
read -p "Enter action symbol: " operator

sqrt() {
	echo sqrt "($1)" | bc -l
}

case $operator in
"+") echo "$x + $y =" $(expr "$x" + "$y");;
"*") echo "$x * $y =" $(expr "$x" \* "$y");;
"-") echo "$x - $y =" $(expr "$x" - "$y");;
"/") if [ "$y" -eq 0 ]
then
	echo "Cannot divide by zero!"
else
	echo "$x / $y =" $(expr "$x" / "$y")
fi;;
"^") echo "$x ^ $y =" $(( "$x" ** "$y" ));;
"sqrt") echo "sqrt($x) =" $(sqrt $x);;
*) echo "unknown operation!"
esac
