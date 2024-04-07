#!/bin/bash 

# Update the system 
sudo apt update -y;
sudo apt upgrade -f; 
sleep 15

# Install Basic Tools 
sudo apt install snap nmap curl wget psensor htop gthumb openssh-server pip steam -y
sleep 8
echo "Moving onto next portion" 

# Enable ssh 
sudo systemctl enable ssh; 
sudo systemctl start ssh
sleep 5

#Offer the user a choice of which browser they would like
read -p "Which browser would you like? 'Brave' 'Tor' 'Vivaldi' 'N/A':" $browser
case $browser in
"Brave")
    sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg; 

    echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list; 

    sudo apt update; 
    sudo apt install brave-browser
    sleep 7 ;;
"Tor")
sudo  apt install tor -y 
sleep 5 ;;
"Vivaldi")
sudo apt-get -y install ./vivaldi*.deb
sleep 10 ;; 
"N/A")
echo "User did not want a browser"
sleep 10 ;;
esac

# Ask the User if they want to change DNS
read -p "Would you like to change your DNS? 'Yes' 'No':" yes_dns no_dns
if [ "$yes_dns" = "Yes" ]; then 
    # Manual Assignment of DNS
    read -p "Enter DNS:" Primary_DNS_IP
    read -p "Enter Secondary DNS:" Secondary_DNS_IP 
        sleep 3 
    # Update /etc/resolv.conf
    sudo tee /etc/resolv.conf > /dev/null <<EOF
    nameserver $Primary_DNS_IP
    nameserver $Secondary_DNS_IP
EOF
    sleep 3 
    
elif [ "$no_dns" = "No" ]; then 
    echo "Skipping DNS" 
fi 
sleep 2

read -p "Do you want to download Spotify? 'Yes' 'No':" yes_spotify no_spotify

if [ "$yes_spotify" = 'Yes' ]; then 
    # Install Spotify & Discord
    read -p "Would you like to install via Snap? Enter 'Yes' OR 'No': " snap_install no_snap_install
    
    if [ "$snap_install" = "Yes" ]; then
        sudo snap install spotify 
    elif [ "$no_snap_install" = "No" ]; then
        curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

        sudo apt-get update -y
        sudo apt-get install spotify-client -y
    else
        echo "Invalid option. Please enter 'Snap' or 'No Snap'."
    fi
elif [ "$no_spotify" = 'No' ]; then
    echo "User does not want Spotify."
fi

sleep 2 

while true; do
    # Prompt User
    read -p "Would you like to install another program? 'Yes' 'No':" yes_program no_program

    # Check User's Response
    if [ "$yes_program" = 'Yes' ]; then
        # Install Program
        read -p "Type in program you might want:" misc_program
        sudo apt install "$misc_program" -y
        sleep 6
    elif [ "$no_program" = 'No' ]; then
        #Break Loop
        echo "User does not want other programs."
        break
    else
        # Invalid Input
        echo "Invalid input. Please enter 'Yes' or 'No'."
    fi
done

sleep 5 

read -p "Would you like Rust, Python, or C to be installed? 'Yes' 'No': " yes_language no_language

if [ "$yes_language" = 'Yes' ]; then 
    read -p "Type in program you might want: 'Rust' 'Python' 'C': " language

    if [ "$language" = 'Rust' ]; then
        curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf | sh
        sleep 12
        source $HOME/.cargo/env
        sleep 2 
        sudo apt update -y
        sudo apt install build-essential -y
        sleep 7
    elif [ "$language" = 'Python' ]; then
        sudo apt install python3 -y
        sleep 7 
        python3 --version
        sleep 3 
    elif [ "$language" = 'C' ]; then
        sudo apt install gcc -y
        sleep 15 
        gcc --version
    else
        echo "Invalid option"
        exit 1
    fi
elif [ "$no_language" = 'No' ]; then
    echo "User does not want any additional languages" 
    sleep 1 
else
    echo "Invalid option"
    exit 1
fi

echo "Welcome to Linux."

exit 0 