#!/bin/bash

## Create a profile file for all the keys to PINK and set alphanumeric values to BLUE
## Then copy that file to /etc/g810/profile

PINK=ff67cf
BLUE=89cff0
LIMEGREEN=00ff00
WHITE=eb6c52

declare -a OTHERS=('tab' 'capslock' 'space' 'backspace' 'enter')

LOGO='logo'
FUNCTIONS='functions'
KEYS='keys'
FKEYS='fkeys'
ARROWS='arrows'
MODIFIERS='modifiers'

gpro-led -g $LOGO $BLUE 
gpro-led -g $FUNCTIONS $BLUE 
gpro-led -g $KEYS $PINK 
gpro-led -g $FKEYS $WHITE
gpro-led -g $MODIFIERS $WHITE
gpro-led -g $ARROWS $PINK 

for other in ${OTHERS[@]}; do
    gpro-led -k $other $WHITE 
done

for num in {0..9}; do 
    gpro-led -k $num $BLUE 
done

for char in {a..z}; do
    gpro-led -k $char $BLUE 
done

