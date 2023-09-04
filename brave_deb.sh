#! /bin/bash

brave_release_channel(){
    sudo apt install curl
    
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
    
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    
    sudo apt update
    
    sudo apt install brave-browser
    
}

brave_beta(){
    sudo apt install curl

    sudo curl -fsSLo /usr/share/keyrings/brave-browser-beta-archive-keyring.gpg https://brave-browser-apt-beta.s3.brave.com/brave-browser-beta-archive-keyring.gpg
    
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-beta-archive-keyring.gpg] https://brave-browser-apt-beta.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
    
    sudo apt update
    
    sudo apt install brave-browser-beta
    
}

brave_nightly_channel(){

    sudo apt install curl
    
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg https://brave-browser-apt-nightly.s3.brave.com/brave-browser-nightly-archive-keyring.gpg
    
    echo "deb [signed-by=/usr/share/keyrings/brave-browser-nightly-archive-keyring.gpg] https://brave-browser-apt-nightly.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-nightly.list
    
    sudo apt update
    
    sudo apt install brave-browser-nightly

}

echo -e "Which version of Brave do you wanna install?\n 1) Release\n 2) Beta\n 3) Nightly\n "

read input
case $input in
    1) brave_release_channel;;
    2) brave_beta;;
    3) brave_nightly_channel;;
    *) echo "Quitting...";;
esac
