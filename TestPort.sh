#!/bin/bash

########################################################################################################
# Know Issue: Bash Arrays are not "First Class Values" -- You Can't Pass them like "Normal" Parameters #
########################################################################################################
# Below IF Statment is a workaround to Know Issue #
###################################################

##########################################################
# Detect if Paramter 1 is passing an arry or a file path #
##########################################################
if [[ $1 = *['/']* ]]
then
	####################################################################
	# File Path was detected: Setting Parameter 1 get contents of file #
	####################################################################
	declare -a COMPUTERLIST=( $( cat $1 ) )
	PORT=$2
else
	########################################################################################
	# Array was detected: Forcing all Parameter into First Variable (Minus Last Parameter) #
	########################################################################################
	arg1=$1;
	COMPUTERLIST=( "$@" )
	###############################################
	# Forcing Last Parameter into Second Variable #
	###############################################
	last_idx=$(( ${#COMPUTERLIST[@]} -1 ))
	PORT=${COMPUTERLIST[$last_idx]}
	unset COMPUTERLIST[$last_idx]
fi

echo "Preforming Port Test via curl command"

for ITEM in "${COMPUTERLIST[@]}"
do
 	echo "Curling $PORT on Target Server: $ITEM"
       	curl $ITEM:$PORT
done

echo "End of Curl Script"
