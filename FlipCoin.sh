 echo " WELCOME TO COIN COMBINATION "
#!/bin/bash

counter=0;

declare -A singletdictt;
declare -A doubletdictt;
declare -A tripletdictt;

someFlipper ()
{
	result=$((RANDOM%2));

	if [ $result -eq 1 ]
	then
		echo "H";
	else
		echo "T";
	fi;
}
storeDict ()
{
	local -n dictt=$1;
	key=$2;

	dictt[$key]=$((${dictt[$key]}+1));
}
dispDict ()
{
	local -n dictt=$1;
	dicttName=$2;

	echo $dicttName "Dictionary KEY: " ${!dictt[@]};
	echo $dicttName "Dictionary VAL: " ${dictt[@]};
}
calcPercent ()
{
	local -n dictt=$1;

	for key in ${!dictt[@]}
	do
		percentage=$(( ${dictt[$key]}*100/$num ));
		echo "Key: "$key "Value:" ${dictt[$key]} "Percentage: $percentage%";
	done;
}
someCombination ()
{
	endRange=$1;
	local value="";

	for (( i=0; i<$endRange; i++ ))
	do
		value="$value""$(someFlipper)";
	done;

	echo $value;
}
moreFlipper ()
{
	local -n coindictt=$1;
	local combination=$2;
	counter=0;

	while [ $counter -lt $num ]
	do
		value=$(someCombination $combination);
		storeDict coindictt $value;
		(( counter++ ));
	done;
}
getResult ()
{
	local -n flipCoindictt=$1;
	local combination=$2;
	local message=$3;

	moreFlipper flipCoindictt $combination;
	dispDict flipCoindictt $message;
	calcPercent flipCoindictt;
}
sortResult ()
{
	local -n dict=$1;
	local operation=$2;
	local message=$3;

	result=$(echo ${dict[*]} | tr " " "\n" | sort $operation);
	echo $message "Sorted Result : " $result;
}
winningComb ()
{
	local -n dictt=$1;
	local max=-1;
	local winningKey="";

	for key in ${!dictt[@]}
	do
		if [ ${dictt[$key]} -gt $max ]
		then
			max=${dictt[$key]};
			winningKey=$key;
		fi;
	done;

	echo "Winning key : " $winningKey ":" $max;
}
mainFlipper ()
{

	echo "1. For Singlet, meaning 1 coin flip"
	echo "2. For Doublet, meaning 2 coin flip"
	echo "3. For Triplet, meaning 3 coin flip"
	read -p "Select your choice : " number
	read -p "How many times do you want to flip : " num
	if [ $number -eq 1 ]
	then
	getResult singletdictt 1 "SINGLET";
	sortResult singletdictt -n "SINGLET";
	winningComb singletdictt;
	elif [ $number -eq 2 ]
	then
	getResult doubletdictt 2 "DOUBLET";
	sortResult doubletdictt -n "DOUBLET";
	winningComb doubletdictt;
	elif [ $number -eq 3 ]
	then
	getResult tripletdictt 3 "TRIPLET";
	sortResult tripletdictt -n "TRIPLET";
	winningComb tripletdictt;
	else
	echo " enter a value  from 1,2 and 3"
	fi
}

mainFlipper;
