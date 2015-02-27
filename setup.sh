####################################################
#### Setup the enviornment on the linux machine ####
####################################################

# 1. install git and heroku
sudo apt-get install -y git
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh

# 2. Login and set up your SSH
heroku login 
ssh-keygen -t rsa
heroku keys:add


# 3. setup.sh and setup of the environment
git clone https://github.com/startup-class/setup.git
./setup/setup.sh   
git clone https://github.com/jcizel/dotfiles.git
