# Oort![Logo](https://raw.githubusercontent.com/psi-iota/Oortold/master/Oort%20Logo.png)
Your perfect edge router.

## Description
This is a a bundled application using Caddy as a reverse proxy server with an extensible Codeigniter4 front end and an optional ZeroTier AIO management interface. This is currently a W.I.P. and isnt fully functional yet.

## Installation
Curently the install script only works on ubuntu, but we see no reason that Oort is limited to ubuntu.
### Ubuntu Server
#### Download install script
Download the install script, install.sh. Then run it with root privileges. For example
```
cd /tmp  
wget https://raw.githubusercontent.com/psi-iota/Oort/master/install/install.sh  
sudo bash install-ubuntu.sh  
```
Just follow the the instructions, it should be pretty simple :)
#### Next Steps
Once the installer script completes, go to 
```
http://<ip>:8080/install/ 
```
From there, you'll be able to define an administrator account and preliminary settings.

##### Note
We only ask for email to forward to Let's Encrypt. We do not "phone home", unless you opt in by navigating to /apps/oort/config/telemetry.cfg and change the FALSE to TRUE for the specific option.  

#### Finishing up
Just navigate to:
```
http://<ip>/oort
```
log in, and enjoy!

