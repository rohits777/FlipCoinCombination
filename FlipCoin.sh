echo "Welcome to flip coin combination program"

#! /bin/bash

read -p "Enter how many times you want to flip : " n
printf "\n"

function SingletFlipper()
{
	flip=$((RANDOM%2))
	if [ $flip -eq 0 ]
	then
		((H++))
		Singlet[H]=$H
	else
		((T++))
		Singlet[T]=$T
	fi
}
function DoubletFlipper()
{
	flip=$((RANDOM%4))
	if [ $flip -eq 0 ]
	then
		((HH++))
		Doublet[HH]=$HH
	elif [ $flip -eq 1 ]
	then
		((TT++))
		Doublet[TT]=$TT
	elif [ $flip -eq 2 ]
	then
		((HT++))
		Doublet[HT]=$HT
	else
		((TH++))
		Doublet[TH]=$TH
	fi
}

declare -A Singlet
H=0
T=0

for (( i=0 ; i<$n ; i++ ))
do
	SingletFlipper
done

for i in ${!Singlet[@]}
do
echo "$i - ${Singlet[$i]}"
if [[ $i -eq H ]]
then
echo "Singlet Head Percentage H : `echo "scale=1; ${Singlet[$i]}*100/$n" | bc ` %"
else
echo "Singlet Head Percentage H : `echo "scale=1; ${Singlet[$i]}*100/$n" | bc ` %"
fi
done


declare -A Doublet
HH=0
TT=0
HT=0
TH=0

for (( i=0 ; i<$n ;i++ ))
do
	DoubletFlipper
done

for j in ${!Doublet[@]}
do
    echo "$j - ${Doublet[$j]}"
    if [[ $j -eq HH ]]
    then
        echo "Doublet Head-Head Percentage HH : `echo "scale=1; ${Doublet[$j]}*100/$n" | bc ` %"
    elif [[ $j -eq TT ]]
    then
        echo "Doublet Tail-Tail Percentage TT : `echo "scale=1; ${Doublet[$j]}*100/$n" | bc ` %" 
    elif [[ $j -eq HT ]]
    then
        echo "Doublet Head-Tail Percentage HT : `echo "scale=1; ${Doublet[$j]}*100/$n" | bc ` %" 
    else
        echo "Doublet Tail-Head Percentage TH : `echo "scale=1; ${Doublet[$j]}*100/$n" | bc ` %" 
    fi
done
