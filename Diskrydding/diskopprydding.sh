#!/bin/bash
# Student: 225087 - Bjørnar Borge - alene

PROGNAME="$(basename "$0")"

# Hjelpe program
usage() {
	echo -e "Programnavn: $PROGNAME\nBruk: $PROGNAME [-s storrelse]/[-l filnavn]"
	return
}

# Case med variabler for å ta imot parametere som blir overført fra terminalen
storrelse=
logg=
katalog=

while [[ -n "$1" ]]; do
case "$1" in
	-s | --storrelse)	shift
        			storrelse=$1
				;;
	-l | --loggfil) 	shift
    				logg=$1
				;;
	-r)		 	shift
				rekursiv=$1
				;;
	*)          		katalog="/$1"
                  		;;
	-h | --help)        	usage
                            	exit
                            	;;
esac
shift
done   

echo -e "Her er mappen som gjennomgås: "$katalog"
Timestamp:" $(date +%d-%m-%y-%T)"" # Formatere timestamp som presenteres for å holde oversikt i .log filen på når endringene er gjennomført
cd -- "$katalog" # Må gå til katalog for å kunne kjøre ls på katalogen og få gjennomført valg
MAPPE="$(ls -S "$katalog")"
(
for i in $MAPPE
do	
	if [[ -d "$i" ]]; then
		mappe_storrelse=$(sudo du -s "$i" | cut -f1) # Kommando for å få frem bytes størrelsen på mappen for så å cut'e output
		if [[ "$mappe_storrelse" -gt "$storrelse" ]]; then # Hvis mappestorrelsen er større enn parameteren storrelse så vil den bli med i loopen
			echo -e "\n"
			echo "Mappe:" "$i"
			echo "Størrelse i bytes:" "$mappe_storrelse"
			# Read for å ta imot valg på den filen som blir presentert
			read -r -p "Vil du slette mappen $i, eller komprimere mappen eller ignorere mappen? [s/k/i]: " svar
			echo "Du svarte:" "$svar"
			if [[ "$svar" = [Ss] ]]; then # Hvis bruker svarer "S/s": sletting:
				echo "Sletter..."
				echo "1.."
				echo "2.."
				echo "3.."
				echo "Følgende mappe er slettet:"
				rm -r "$i" # Kommando for å slette fil. Liten forskjell fra slette mappe.
				echo "$i" "mappen er slettet."

			elif [[ "$svar" = [Kk] ]]; then # Hvis bruker svarer "K/k": komprimering:
				echo "Komprimerer..."
				echo "1.."
				echo "2.."
				echo "3.."
				echo "Følgende filer/mapper komprimert:"
				tar -zcvf ""$i".tar.gz" "$i" # Kode for å opprette en komprimert .tar.gz mappe
			elif [[ "$svar" = [Ii] ]]; then # Hvis bruker svarer "I/i": ignorer:
		    		continue # Fortsetter i loopen til neste fil hvis ignorert valg
			fi
	    	fi
	else	
    		fil_storrelse=$(du -b "$i" | cut -f1) # Kommando for å få frem bytes størrelsen på filen for så å cut'e output
		if [[ "$fil_storrelse" -gt "$storrelse" ]]; then # Hvis filstorrelse er større enn parameteren storrelse så vil den bli med i loopen
			echo -e "\n"
			echo "Fil:" "$i"
			echo "Størrelse i bytes:" "$fil_storrelse"
			# Read for å ta imot valg på den filen som blir presentert
			read -r -p "Vil du slette filen $i, eller komprimere filen eller ignorere filen? [s/k/i]: " svar 
			echo "Du svarte:" "$svar"
			if [[ "$svar" = [Ss] ]]; then # Hvis bruker svarer "S/s": sletting:
				echo "Sletter..."
				echo "1.."
				echo "2.."
				echo "3.."
				echo "Følgende filer er slettet:"
				rm "$i" # Kommando for å slette fil. Liten forskjell fra slette mappe.
				echo "$i" "filen(e) er slettet."
			elif [[ "$svar" = [Kk] ]]; then # Hvis bruker svarer "K/k": komprimering:
				echo "Komprimerer..."
				echo "1.."
				echo "2.."
				echo "3.."
				echo "Følgende filer komprimert:"
				tar -zcvf ""$i".tar.gz" "$i" # Kode for å opprette en komprimert .tar.gz mappe
			elif [[ "$svar" = [Ii] ]]; then # Hvis bruker svarer "I/i": ignorer:
		    		continue # Fortsetter i loopen til neste fil hvis ignorert valg
			fi
	    	fi
    	
    	fi
done  )  2>&1 | tee -a diskopprydding.log # Sender til standard error, og oppretter en .log fil på det som er gjort i programmet







    
