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
function TripletFlipper()
{
	flip=$((RANDOM%8))
	if [ $flip -eq 0 ]
	then
		((HHH++))
		Triplet[HHH]=$HHH
	elif [ $flip -eq 1 ]
	then
		((HHT++))
		Triplet[HHT]=$HHT
	elif [ $flip -eq 2 ]
	then
		((HTH++))
		Triplet[HTH]=$HTH
	elif [ $flip -eq 3 ]
	then
		((HTT++))
		Triplet[HTT]=$HTT
	elif [ $flip -eq 4 ]
	then
		((THH++))
		Triplet[THH]=$THH
	elif [ $flip -eq 5 ]
	then
		((THT++))
		Triplet[THT]=$THT
	elif [ $flip -eq 6 ]
	then
		((TTH++))
		Triplet[TTH]=$TTH
	else
		((TTT++))
		Triplet[TTT]=$TTT
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


declare -A Triplet
HHH=0
HHT=0
HTH=0
HTT=0
TTT=0
THH=0
THT=0
TTH=0

for (( i=0; i<$n; i++ ))
do
	TripletFlipper
done

for k in ${!Triplet[@]}
do
    echo "$k - ${Triplet[$k]}"
    if [[ $k -eq HHH ]]
    then
        echo "Triplet H-H-H percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq HHT ]]
    then
        echo "Triplet H-H-T percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq HTH ]]
    then
        echo "Triplet H-T-H percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq HTT ]]
    then
        echo "Triplet H-T-T percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq THH ]]
    then
        echo "Triplet T-H-H percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq THT ]]
    then
        echo "Triplet T-H-T percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    elif [[ $k -eq TTH ]]
    then
        echo "Triplet T-T-H percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    else
        echo "Triplet T-T-T percentage : `echo "scale=1; ${Triplet[$k]}*100/$n" | bc ` %"
    fi
done
