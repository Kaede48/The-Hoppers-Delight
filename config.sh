#!/bin/bash 

# Update the system 
sudo apt update -y
sudo apt upgrade -f
sleep 5;    

# Install Basic Tools 
sudo apt install snap nmap curl wget psensor htop gthumb openssh-server pip steam 
sleep 10;
echo "Moving onto next portion" 

# Enable ssh 
sudo systemctl enable ssh; 
sudo systemctl start ssh
sleep 5;

# Ask the User if they want to change DNS
read -p "Would you like to change your DNS? 'Yes' 'No':" yes_dns no_dns
if [ "$yes_dns" = "Yes" ]; then 
    # Manual Assignment of DNS
    read -p "Enter DNS:" Primary_DNS_IP
    read -p "Enter Secondary DNS:" Secondary_DNS_IP 
        sleep 7
    # Update /etc/resolv.conf
    sudo tee /etc/resolv.conf > /dev/null <<EOF
    nameserver $Primary_DNS_IP
    nameserver $Secondary_DNS_IP
EOF
    sleep 5
    
elif [ "$no_dns" = "No" ]; then 
    echo "Skipping DNS" 
fi 
sleep 7;

read -p "Do you want to download Spotify? 'Yes' 'No':" yes_spotify no_spotify

if [ "$yes_spotify" = 'Yes' ]; then 
        curl -sS https://download.spotify.com/debian/pubkey_7A3A762FAFD4A51F.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg
        echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

        sudo apt-get update -y
        sudo apt-get install spotify-client -y
elif [ "$no_spotify" = 'No' ]; then
    echo "User does not want Spotify."
fi

sleep 5;

while true; do
    # Prompt User
    read -p "Would you like to install another program? 'Yes' 'No':" answer

    # Check User's Response
    if [ "$answer" = 'Yes' ]; then
        # Install Program
        read -p "Type in program you might want:" misc_program
        sudo apt install "$misc_program" -y
        sleep 6
    elif [ "$answer" = 'No' ]; then
        # Break Loop
        echo "User does not want other programs."
        break
    else
        # Invalid Input
        echo "Invalid input. Please enter 'Yes' or 'No'."
    fi
done


sleep 5;

read -p "Would you like Python, or C to be installed? 'Yes' 'No': " yes_language no_language

if [ "$yes_language" = 'Yes' ]; then 
    read -p "Type in program you might want: 'Python' 'C': " language

    if  [ "$language" = 'Python' ]; then
        sudo apt install python3 -y
        sleep 14
        python3 --version
        sleep 10
    elif [ "$language" = 'C' ]; then
        sudo apt install gcc -y
        sleep 10
        gcc --version
    else
        echo "Invalid option"
        exit 1
    fi
elif [ "$no_language" = 'No' ]; then
    echo "User does not want any additional languages" 
    sleep 5 
else
    echo "Invalid option"
    exit 1
fi

echo "Welcome to Linux."

exit 0 
