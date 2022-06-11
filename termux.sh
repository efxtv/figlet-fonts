Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
IGreen='\033[0;92m'
Yellow='\033[0;33m'
IYellow='\033[0;93m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
White='\033[0;37m'
clear='\033[0m'

#Calling file has 1000+ figlet fonts
#tar cv *| xz -9 > $HOME/file.tar.xz; 
#tar xvf file.tar.xz -C /data/data/com.termux/files/usr/share/figlet

#Creating server
#curl -L -o $HOME/Figlet-fonts-1000plus.tar.xz https://github.com/efxtv/figlet-fonts/blob/main/Figlet-fonts-1000plus.tar.xz?raw=true -s;sudo tar xvf Figlet-fonts-1000plus.tar.xz -C /data/data/com.termux/files/usr/share/figlet
 > /dev/null 2>&1
#rm $HOME/Figlet-fonts-1000plus.tar.xz

figletpathm()
{
czip=$(which figlet|grep -o figlet)
if [ "$czip" == "figlet" ];
then
echo -e "[${Green}✔${clear}] ${IYellow} Figlet found... ${clear}"
else
echo -e "[${Green}!${clear}] ${Red} Figlet path not found contact admin ${clear}"
echo -e "[${Green}!${clear}] ${Red} Install : ${Green}pkg install figlet${clear}"
echo -e "[${Green}!${clear}] ${IYellow} Please try again...${clear}"
echo -e "[${Green}!${clear}] ${IYellow} Press ${Green}ctrl + c${IYellow} to exit...${clear}"
read

fi
}


installedornot()
{
if [[ -e /data/data/com.termux/files/usr/share/figlet/EFXfiglet997.flf ]]
then
echo -e "[${Green}✔${clear}] ${IYellow} Already installed... ${clear}"
echo -e "[${Green}✔${clear}] ${IYellow} Hold it...${clear}"
sleep 3
else
echo -e "[${Green}✔${clear}] ${IYellow} Adding extra files... ${clear}"
sleep 1
curl -L -o $HOME/Figlet-fonts-1000plus.tar.xz https://github.com/efxtv/figlet-fonts/blob/main/Figlet-fonts-1000plus.tar.xz?raw=true -s;sudo tar xvf Figlet-fonts-1000plus.tar.xz -C /data/data/com.termux/files/usr/share/figlet
rm Figlet-fonts-1000plus.tar.xz
echo -e "[${Green}✔${clear}] ${IYellow} Done... ${clear}"
echo
echo -e "[${Green}✔${clear}] ${IYellow} Added 1000+ figlet files... ${clear}"

fi
}
figletpathm
installedornot
echo -e "[${Green}✔${clear}] ${IYellow} Calling server files... ${clear}"
curl -L -o $HOME/FILE1 https://raw.githubusercontent.com/efxtv/figlet-fonts/main/FILE1 -s
curl -L -o $HOME/FILE3 https://raw.githubusercontent.com/efxtv/figlet-fonts/main/FILE3 -s
echo -e "${clear}[${Green}✔${clear}] ${IYellow} Done... ${clear}"


echo -en "[${Green}✔${clear}] ${IYellow} Enter some text to print: ${IGreen}" 
read bczo

ls -1 /data/data/com.termux/files/usr/share/figlet|grep flf|grep -v EFXfiglet1073|grep -v EFXfiglet1159|awk '{print "figlet -f "$1" sangananio; echo [[--"$1"--]]"}' >saved
cat saved|sed "s#sangananio#$bczo#g"|bash >FILE2

sleep 3
cat FILE1 FILE2 FILE3 >index.html
rm FILE1 FILE2 FILE3

pkill php
echo -e "${clear}[${Green}✔${clear}] ${IYellow} Starting PHP server...${clear}"
php -S localhost:5555 > /dev/null 2>&1 &

echo -e "[${Green}✔${clear}] ${IYellow} Server started: ${Green} http://localhost:5555"
echo -e "${clear}[${Green}✔${clear}] ${IYellow} Press enter to close: \c"
read
pkill php
rm index.html

