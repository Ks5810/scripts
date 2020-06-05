#!/bin/bash
##Create a profile file for all the keys to PINK and set alphanumeric values to BLUE
##Then copy that file to /etc/g810/profile

TEMP_PATH="$HOME/key-settings/key-settings.profile"

PINK=ff67cf
BLUE=89cff0
LIMEGREEN=00ff00
WHITE=eb6c52

declare -a OTHERS=('tab' 'capslock' 'space' 'backspace' 'enter' 'shift_left' 'shiftleft' 'shiftl')
LOGO='logo'
FUNCTIONS='functions'
KEYS='keys'
FKEYS='fkeys'
ARROWS='arrows'
MODIFIERS='modifiers'
INDICATORS='indicators'

##Create a temporary file
touch $TEMP_PATH

##Writing profile commands to $TEMP_PATH
echo "##Profile file created from $HOME/key-settings/ind_keys.sh" > $TEMP_PATH
echo "" >> $TEMP_PATH
echo "g $LOGO $BLUE" >> $TEMP_PATH
echo "g $FUNCTIONS $BLUE" >> $TEMP_PATH
echo "g $KEYS $PINK" >> $TEMP_PATH
echo "g $FKEYS $WHITE" >> $TEMP_PATH
echo "g $ARROWS $PINK" >> $TEMP_PATH
echo "g $INDICATORS $BLUE" >> $TEMP_PATH
echo "g $MODIFIERS $WHITE" >> $TEMP_PATH

for other in "${OTHERS[@]}"; do
    echo "k $other $WHITE" >> $TEMP_PATH
done

for num in {0..9}; do 
    echo "k $num $BLUE" >> $TEMP_PATH
done

for char in {a..z}; do
    echo "k $char $BLUE" >> $TEMP_PATH
done

#Commit
echo "#Commit" >> $TEMP_PATH
echo "c" >> $TEMP_PATH

#Write tmporary copy to `/etc/g810/profile`
cat $TEMP_PATH > /etc/g810-led/profile
echo "profile file successfully created in /etc/g810/profile"
