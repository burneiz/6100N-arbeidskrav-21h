#!/bin/bash
# Student: 225087 - Bjørnar Borge - alene

# Random spill funksjon
random_spill(){
	while true; do
		# Initialisere variabelen num
		typeset -i num=0
		# Generere ett random nr mellom 1-100.
		(( svar = RANDOM % 100 + 1 ))

		# Start på spillet
		echo "-----------------------------------"
		echo "Program startet:"
		echo "-----------------------------------"
		while (( gjett != svar )); do
			num+=1 # Legge til for å få samlet forsøk
			read -p "Gjett det hemmelige tallet: " gjett
			if (( gjett < svar )); then
				echo "$gjett er mindre enn det hemmelige tallet."
			elif (( gjett > svar )); then
				echo "$gjett er større enn det hemmelige tallet."
			fi
		done
		
		echo "-----------------------------------"
		echo -e "Riktig! Det tok $num forsøk, og det hemmelige tallet var $gjett.\n"
		
		read -p "Ønsker du å fortsette spillet? (y/n): " svar_avslutt
		if [[ "$svar_avslutt" = "y" ]]; then
			echo "Starter spillet på nytt:"
			echo "-----------------------------------"
			random_spill
		else
			echo "3.."
			echo "2.."
			echo "1.."
			echo "Program avsluttes!"
			exit
		fi
	done
}

# Her kommer programmet
while true; do
	echo "
-----------------------------------
Random-spill MENY

Trykk 1 for å starte programmet.

Trykk 0 for å avslutte programmet.
-----------------------------------"
	read -p "Skriv inn tall: " tall
	if [[ "$tall" =~ ^-?[0-9]+$ ]]; then 
		if [[ "$tall" -eq 0 ]]; then
			echo "
-----------------------------------
Programmet avsluttes!
-----------------------------------" 
			exit
		fi
		if [[ "$tall" -eq 1 ]]; then
			random_spill
		else	 
			echo "
-----------------------------------
Tallet $rows er ikke mellom 1 eller 0.
Prøv på nytt.
-----------------------------------" 
		fi
	else 
		echo "
-----------------------------------
Det du skrev inn er ikke ett tall.
Prøv på nytt.
-----------------------------------" >&2 
		continue
	fi
done
		
