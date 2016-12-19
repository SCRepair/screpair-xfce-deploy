#################################################
## These first several can be run directly as root
## or via SUDO
## Make sure all of the packages are up to date
sudo yum -y update

## This provides extra packages not included in the base
sudo yum -y install epel-release

## This is optional, but is a sanity-saver.
sudo yum -y install bash-completion

## This installs the XFCE desktop environment.
sudo yum -y groups install Xfce

## This installs your VNC Server.
sudo yum -y install tigervnc-server

## This puts the VNC server under management by systemd.
sudo cp /lib/systemd/system/vncserver@.service /etc/systemd/system/vncserver@:1.service

## This creates a vnctestuser without a password, to be set later.
adduser --disabled-password --gecos "" vnctestuser

## Install Google Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
yum install ./google-chrome-stable_current_*.rpm

## Enable tigervncserver and reload systemctl
sudo systemctl enable vncserver@:1.service
sudo systemctl daemon-reload
