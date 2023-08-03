#!/bin/bash



# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
On_Black='\033[40m'       # Black
On_Red='\033[41m'         # Red
On_Green='\033[42m'       # Green
On_Yellow='\033[43m'      # Yellow
On_Blue='\033[44m'        # Blue
On_Purple='\033[45m'      # Purple
On_Cyan='\033[46m'        # Cyan
On_White='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
On_IBlack='\033[0;100m'   # Black
On_IRed='\033[0;101m'     # Red
On_IGreen='\033[0;102m'   # Green
On_IYellow='\033[0;103m'  # Yellow
On_IBlue='\033[0;104m'    # Blue
On_IPurple='\033[0;105m'  # Purple
On_ICyan='\033[0;106m'    # Cyan
On_IWhite='\033[0;107m'   # White

																																function move {
																																				sudo mv $file.html	$path
																																				sudo mv $file.json	$path
																																				sudo mv $file.ejson	$path
																																				sudo mv $file.md	$path
																																				sudo mv $file.csv	$path
																																				sudo mv $file.ecsv	$path

																																				}


																																function opt {
																																						echo -e "if you wont to personalize scan press enter"
																																						echo -e "if you wont to see option write alien"
																																				read r
																																			if [[ ($r == "alien") ]]
																																				then
																																				ffuf -h
																																				read -p "enter option > " option
																																			else
																																				read -p "enter option > " option
																																			fi
																																			}


																																function mkdir {
																																		echo "enter directory name or create new one"
																																		read -p "> " path
																																		if [[ ( -d "$path" ) ]]
																																		then
																																		echo "done"
																																		else
																																		sudo mkdir $path
																																		echo "directory created"
																																		fi
																																		echo -e "enter file name"
																																		read file
																																		echo -e "select extension "
																																		read -p "json, ejson, html, md, csv, ecsv 'all' for all formats " ext
																																		}
function repeat {
		echo -e "enter target"
		echo -e "remeber subdomain corret format https://FUZZ.target.com/"
		echo -e "for this scan you had to enter the FUZZ flag olso like in the example"
		read ip
		echo -e $ip
		read -p "it's correct? type y/n " risposta
		if [[ ( $risposta == "n" ) ]]
		then
		repeat
		else
		echo "M-alien-M"
		fi
		cd wordlists/DNS && tree
		echo -e "$Red" "select wordlist"
		read w
		cd ../../
	opt
sudo ffuf -w wordlists/DNS/$w:FUZZ -u $ip  $option  -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
}

																							function menu {
																				echo -e '\033[1;95m'  "What do you want to do?"
																				echo -e '\033[1;95m'  "1) directory fuzzing "
																				echo -e '\033[1;95m'  "2) extensions fuzzing "
																				echo -e '\033[1;95m'  "3) page fuzzing "
																				echo -e '\033[1;95m'  "4) recursive fuzzing "
																				echo -e '\033[1;95m'  "5) sub-domain fuzzing"
																				echo -e '\033[1;95m'  "6) vhost fuzzing"
																				echo -e '\033[1;95m'  "7) parameter fuzzing GET"
																				echo -e '\033[1;95m'  "8) parameter fuzzing POST"
																				echo -e '\033[1;95m'  "9) value fuzzing"
																				echo -e '\033[1;95m'  "q) quit "
																					read -p "> " choice
																					}
	banner "automatic"
	banner "ffufer"
	sleep 0

	menu

	case $choice in

1) mkdir
		echo -e "$Red" "enter target"
		echo -e "(format http:// or https://target.com https://www.target.com)"
		read ip
		cd wordlists/directory && tree
		echo -e "$Green" "select wordlist \n(copy and paste)"
		read w
		cd ../../
	opt

sudo ffuf -w wordlists/directory/$w:FUZZ -u $ip/FUZZ  $option -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
2) mkdir
		echo -e "$Red" "enter target"
		echo -e "(format http:// or https://target.com/page)"
		read ip
		cd wordlists/extension/ && tree
		echo -e $ip/FUZZ
		echo -e "$Red" "select wordlist(copy and paste)"
		read w
		cd ../../
	opt
sudo ffuf -w wordlists/extension/$w:FUZZ -u $ip"FUZZ" $option  -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
3) mkdir
		echo -e "$Red" "enter target"
		echo -e "$green" "format http:// or https://target.com"
		read ip
		echo -e "$green" "enter extension \nex: php txt html"
		read -p "$ip/FUZZ.$ext1" ext1
		cd wordlists/directory && tree
		echo -e "$BYellow" "select wordlist"
		read w
		cd ../../
	opt
sudo ffuf -w wordlists/directory/$w:FUZZ -u $ip/FUZZ.$ext1 $option -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
4) mkdir
		echo -e "$IBlue" "enter target"
		read -p   "> " ip
		read -p "select recursion depth > " de
		cd wordlists/directory && tree
		echo -e "$Red" "select wordlist"
		read w
		echo -e "$Red" "select extension(whitout dot ex:html php txt)"
		read ex
		cd ../../
	opt
sudo ffuf -w wordlists/directory/$w:FUZZ -u $ip/FUZZ -recursion -recursion-depth $de -e .$ex $option -v   -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
5) mkdir
		repeat
;;
6) mkdir
		echo "enter target"
		read -p "http:// or https:// > " ht
		read -p "target format < target.com " ip
		echo -e "$ht""$ip" -H "Host: FUZZ.$ip"
		cd wordlists/DNS && tree
		echo -e "$Red" "select wordlist"
		read w
		cd ../../
		opt
sudo ffuf -w wordlists/DNS/$w:FUZZ -u "$ht""$ip" -H "Host: FUZZ.""$ip" $option -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
7) mkdir
		echo -e "$Red" "select target(ex. http://admin.example.com/admin/admin.php?)"
		read target
		cd wordlists/BurpSuite-ParamMiner && tree
		echo -e "$Red" "select wordlist"
		read w
		cd ../../
	opt
sudo ffuf -w wordlists/BurpSuite-ParamMiner/$w:FUZZ -u "$target""FUZZ=key" $option   -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
8) mkdir
		echo -e "$Red" "select target/n(ex. http://admin.example.com/admin/admin.php?)"
		read target
		echo -e "$Green" "$target -X POST -d FUZZ=key -H Content-Type: "
		read -p "enter content type: " ct
		cd wordlists/BurpSuite-ParamMiner && tree
		echo -e "$Red" "select wordlist"
		read w
		cd ../../
	opt
sudo ffuf -w wordlists/BurpSuite-ParamMiner/$w:FUZZ -u $target -X POST -d "FUZZ=key" -H "Content-Type: $ct" $option  -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
9)  mkdir
		echo -e "$Red" "select target/n(ex. http://admin.example.com/admin/admin.php?)"
		read target
		echo -e "enter keyword < ex. id >"
		read -p "$target keyword=num " key
		echo -e "$Green" "$target -X POST -d $key=num -H Content-Type: "
		read -p "enter content type: " ct
		echo -e "$Green" "defaulut wordlist set ids.txt"

	opt
sudo ffuf -w wordlists/ids.txt:FUZZ -u $target -X GET -d "$key=FUZZ" -H "Content-Type: $ct" $option -o $file  -od  $path  -of  $ext
move
bash automatic_ffufer.sh
;;
	q) banner "thank's"
	   banner "alien"
	;;

	*) banner "nano"
	   banner "meca"

	bash automatic_ffufer.sh
	;;
esac


