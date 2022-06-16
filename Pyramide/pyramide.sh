#!/bin/bash
# Student: 225087 - Bjørnar Borge - alene

# Pyramide funksjon
pyramide(){
	number=int
	for((i=1; i<=rows; i++))
	do
	  for((j=1; j<=rows - i; j++))
	  do
	    echo -n " " # Fjerner du mellomrommet her og kjører koden så vil den lage trekant fremfor pyramide. Kunne ha laget mer utfyllende meny og to funksjoner så du kunne ha kjørt begge funksjonene i ett program. Men det får være til en annen gang!
	  done
	  number=$i
	  for((j=1; j<=2*i - 1; j++))
	  do
	    if [ $j -lt $i ];
	    then
	      echo -n "$number"
	    
	    elif [ $j -eq $i ];
	    then
	      echo -n "$number"
	    
	    else
	      echo -n "$number"
	      
	    fi
	  done
	  echo
	done
}

# Programmet starter her
while true; do
	echo "
-----------------------------------
Vennligst velg ett tall mellom 1-9 for å velge antall rader i pyramiden.

Trykk 0 for å avslutte programmet.
-----------------------------------"
	read -p "Skriv inn tall: " rows
	MIN_VAL=1
	MAX_VAL=9
	
	if [[ "$rows" =~ ^-?[0-9]+$ ]]; then 
		if [[ "$rows" -eq 0 ]]; then
		echo "
-----------------------------------
Programmet avsluttes!
-----------------------------------" 
		exit
		fi
		if [[ "$rows" -ge "$MIN_VAL" && "$rows" -le "$MAX_VAL" ]]; then 
			pyramide
		else	 
			echo "
-----------------------------------
Tallet $rows er ikke mellom 1-9.
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

	

