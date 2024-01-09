# The-Hoppers-Delight
Welcome to The Hopper's Delight. An open-soruce linux-based project that allows you to install and do basic setups based on the distrubtion of your choice. Over time, I plan to add more config files for different distributions. 

Currently, the script is built in Bash as it is solely a terminal-based project; however, when I refresh my python understanding and learn more languages, I plan to add more variety to the config files. 

For example, the script will go the following:

- Update the system
- Allow the User to change their dns servers if wanted. 
- Allow the user to install Brave, an open-source chronium based browser that does not collect any data if wanted. 
- Install basic tools such as: nmap, ssh, htop, psensor, curl, and others (placeholder) 
- Enable SSH if needed.
- Offer a choice to change your desktop background. Support for GNOME, XFCE, and Cinnamon.  
- Offer a prompt to install any extra programs not included in the basic install. 
- Misc (until I define it as this commmit is to get the read me done. 

- Prerequisites
Git must be installed as I recommend using a git clone command in order to clone the respository so that all the files are in one for it to execute. 

- Installing git: 

Debian/Debian-based/Ubuntu/Ubuntu-based: 

sudo apt install git 

Arch/Arch-based Derivatives: 

sudo pacman -S git 

- Installing dos2unix

Dos2unix is a CLI utility that converts text files to Unix-format files. You will need to run install and convert the file for the script to work properly

Installation
Debian/Ubuntu/Derivatives: 

sudo apt install dos2unix 

Arch-based distros: 

sudo pacman -S dos2unix 


Once git is installed, clone the respository to your pc: https://github.com/Kaede48/The-Hoppers-Delight.git
Run the script in the terminal once cloned: ./the_hoppers_delight.sh 
Follow the prompts, script is case-sensitive. Example: typing in ubuntu will return an error, while Ubuntu wlll execute the script if you choose Ubuntu. 


- Quality Control: 
I tested this program using VMs and bare metal installs. I highly suggest you verify your respective distro's checksum hash. 

if you installed your distro on a linux machine: 

md5sum /path/to/your.iso
sha1sum /path/to/your.iso

If you installed your distro on a Windows machine: 

CertUtil -hashfile path\to\your.iso

Both will output a checksum hash that you can compare to the distro's download page. 


You can do this with the following: 

- Support 

I will add more support for non-arch or non-debian based distros over time. Certain arch distros are not universal when it comes to certain installing certain programs which will have its own config file. Example being Manjaro. 

The list is small as I test each one personally to ensure it works on a clean install. 

Thank you for trying this project. 
