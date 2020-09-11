echo "Welcome to flip coin combination program"

x=$(( RANDOM%2 ))
if [[ $x -eq 0 ]]
then
	echo "Head"
else
	echo "Tail"
fi
