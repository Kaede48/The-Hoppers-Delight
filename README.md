# The-Hoppers-Delight
Welcome to The Hopper's Delight. An open-soruce linux-based project that allows you to install and do basic setups based on the distribution of your choice. Over time, I plan to add more config files for different distributions. 

Currently, the script is built in Bash as it is solely a terminal-based project; however, when I refresh my python understanding and learn more languages, I plan to add more variety to the config files. 

For example, the script will go the following:

- Update the system
- Allow the User to change their dns servers if wanted. 
- Allow the user to install Brave, an open-source chronium based browser that does not collect any data if wanted (Firefox is installed out of the box on most distros). 
- Install basic tools such as: nmap, ssh, htop, psensor, curl, and others (placeholder) 
- Enable SSH if needed.
- Offer a choice to change your desktop background. Support for GNOME, XFCE, and Cinnamon.  
- Offer a prompt to install any extra programs not included in the basic install. 

# Prerequisites
<a name="Prerequisites"></a>
Git must be installed as I recommend using a git clone command in order to clone the respository so that all the files are in one for it to execute. 

If you do not want to git clone, you can download it and run it as a normal bash script. Ensure that it has the necessary permissions to run. 

Depending on the download location, you will need to cd to the directory where the script is stored and run using the command below. 

```bash 
bash ./linux config.sh 
```

# Installing Git
<a name="installing-git"></a>

Debian/Debian-based/Ubuntu/Ubuntu-based:

```bash
sudo apt install git
```

Arch/Arch-based Derivatives: 
```bash
sudo pacman -S git 
```
# Installing dos2unix
<a name="Installing Dos2unix"></a> 

Debian/Ubuntu/Derivatives: 
```bash
sudo apt install dos2unix 
```
Arch-based distros: 
```bash
sudo pacman -S dos2unix 
```

Once git is installed, clone the respository to your pc: https://github.com/Kaede48/The-Hoppers-Delight.git

Run the script in the terminal once cloned: ./the_hoppers_delight.sh 

Follow the prompts, script is case-sensitive. Example: typing in ubuntu will return an error, while Ubuntu wlll execute the script if you choose Ubuntu. 


# Quality Control
<a name="Quality Control"></a> 
I tested this program using VMs and bare metal installs. 
Before you begin, I highly suggest you verify your respective distro's checksum hash. To do this, you must get either the hash from the iso file and compare it to the site's given hash. There are programs that can accomplish this but if you wish to do it via the command-line, you can use the following commands for linux & Windows. 

if you installed your distro on a linux machine: 
```bash
md5sum /path/to/your.iso 
OR (depending on the distro, SHA-256 is what you will see of more). 
sha1sum /path/to/your.iso
```
If you installed your distro on a Windows machine: 
```bash
CertUtil -hashfile path\to\your.iso
```
Both will output a checksum hash that you can compare to the distro's download page. 

# Support 
<a name="Support"></a>
The following distributions are supported: 
- Ubuntu 
- Debian 
- Linux Mint 
- Arch linux
- Arco 
- Pop_OS!

I plan to add more to the list. Gentoo and Slackware come to mind. 


Thank you for trying this project. 
