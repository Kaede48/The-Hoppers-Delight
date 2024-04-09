# The-Hoppers-Delight
Welcome to The Hopper's Delight. An open-soruce linux-based project that allows you to install and do basic setups based on the distribution of your choice. This is intented to be simple, not complicated, mostly to make the linux user's experience when hopping around a bit easier. Most of the code can be rewritten to suit your needs, but serves as a template. 

For example, the script will do the following:

- Update the system
- Install Base programs and allow extra programs until the User says No. 
- Allow the User to change their dns servers if wanted. 
- Download & Enable SSH if needed for terminal access. Does not generate key, uses password authentication. You can add an SSH keygen command to allow for this and store it locally. 
- Offer the user a choice if they would like to download a certain programming langauge such as Python or C. 

# Prerequisites
<a name="Prerequisites"></a>
Git must be installed so you can git clone the project. You can download git using the following: 
```bash
sudo apt install git
```

# Quality Control
<a name="Quality Control"></a> 
I tested this program using VMs and bare metal installs. 
Before you begin, I highly suggest you verify your respective distro's checksum hash. To do this, you must get either the hash from the iso file and compare it to the site's given hash. There are programs that can accomplish this but if you wish to do it via the command-line, you can use the following commands for linux & Windows. 

if you installed your distro on another linux machine: 
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
- Pop_OS!

Thanks for trying this project. Use this to tailor what you need for your installs. 
