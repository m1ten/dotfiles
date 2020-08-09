# Manjaro-KDE Setup | m1ten

bold=$(tput bold)
normal=$(tput sgr0)

clear && echo "${bold}Manjaro-KDE Setup | m1ten${normal}" && echo " "

sleep 2

echo " " && echo "${bold}Install yay and update all packages${normal}" && echo " "

sleep 2

sudo pacman -S yay 

sleep 2

yay 

echo " " && echo "${bold}Install apps${normal}" && echo " "

sleep 2

yay -S aur/discord-canary aur/visual-studio-code-insiders aur/github-desktop aur/spotify chromium

echo " " && echo "${bold}Clear cache${normal}" && echo " "

sleep 2

yay -Sc

echo " " && echo "${bold}Modify Breath-Dark, green to blue${normal}" && echo " "

sleep 2

sudo rm -r /usr/share/themes/Breath-Dark
sudo mv Breath-Dark /usr/share/themes

echo " " && echo "${bold}Moved modified Breath-Dark to dir${normal}" && echo " "

echo " " && echo "${bold}Finished Setup!${normal}" && echo "${bold}Rest can be done manually!${normal}" && echo " "