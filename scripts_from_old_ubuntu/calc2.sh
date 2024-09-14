#!/bin/bash
read -p "Enter first value: " x
read -p "Enter second value: " y
read -p "Enter action symbol: " operator

sqrt() {
	echo sqrt "($1)" | bc -l
}

sum() {
	echo "$x+$y" | bc
}

subst() {
	echo "$x-$y" | bc
}

mult() {
	echo "$x*$y" | bc
}

div() {
	if [ "$y" -eq 0 ]
	then
        	echo "Cannot divide by zero!"
	else
        	echo "$x/$y" | bc
	fi
}

pow() {
	echo "$x^$y" | bc
}

case $operator in
"+") echo "$x + $y =" $(sum $x $y);;
"*") echo "$x * $y =" $(mult $x $y);;
"-") echo "$x - $y =" $(subst $x $y);;
"/") echo  "$x / $y =" $(div $x $y);;
"^") echo "$x ^ $y =" $(pow $x $y);;
"sqrt") echo "sqrt($x) =" $(sqrt $x);;
*) echo "unknown operation!"
esac
