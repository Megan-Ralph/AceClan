# README
AceClan Website

Ruby version 2.5.1
Rails version 5.2.3

To run on Windows: (Assuming you haven't used Ruby or Rails before)

You need Windows release 14352 for this to work
Go to settings, "Update & Security", "For Developers" then select "Developer Mode"
Go to control panel, "Programs", "Turn Windows Features On or Off", find "Windows subsystem for Linux" and make sure it's checked. (Might take some time after checking)
Reboot
Search for "Bash" in start menu
Follow installation steps in Bash to create new terminal user and install "Ubuntu for Windows"
Close Bash
Search for "Bash for Windows" in search menu
Follow user set up in terminal
Use the following commands to install dependencies for ruby
`sudo apt-get update`
`sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev software-properties-common libffi-dev`

Use either RBENV or RVM to install Ruby, I'll write the instructions for RBENV but if you want to use RVM you can find easy installation guides online
Copy the following commands one by one
`cd`
`git clone https://github.com/rbenv/rbenv.git ~/.rbenv`
`echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc`
`echo 'eval "$(rbenv init -)"' >> ~/.bashrc`
`exec $SHELL`

`git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build`
`echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc`
`exec $SHELL`

`rbenv install 2.6.1`
`rbenv global 2.6.1`
`ruby -v`

Then run `gem install bundler`
If you installed Ruby using RBENV you'll need to run `rbenv rehash` after installing bundler

#Skip this step if you already have Git set up
`git config --global color.ui true`
`git config --global user.name "YOUR NAME"`
`git config --global user.email "YOUR@EMAIL.com"`
`ssh-keygen -t rsa -b 4096 -C "YOUR@EMAIL.com"`

Now generate a new SSH key and add it to your Github account here `cat ~/.ssh/id_rsa.pub` https://github.com/settings/keys
Check to see if it worked with `ssh -T git@github.com`

Use the following commands to install some dependencies for Rails
`curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -`
`sudo apt-get install -y nodejs`

Now run `gem install rails -v 5.2.3`
(Run `rbenv rehash` if you're using RBENV)
run `rails -v` to see if it was successful
Use the following command to set up MYSQL `sudo apt-get install mysql-server mysql-client libmysqlclient-dev`

Now navigate to the Windows C: drive, do this every time you open Ubuntu for Windows
`cd /mnt/c`
`mkdir -p code`
`cd code`
`git clone https://github.com/Megan-Ralph/AceClan.git`
`cd AceClan`
`bundle install`
`bin/rails db:create`
`bin/rails db:migrate`
`bin/rails server`

Done! :-)

To run on Linux/Unix/Mac systems:

For Debian and Ubuntu run
`sudo apt-get update`
`sudo apt-get install -y curl gnupg build-essential`

For Red Hat, CentOS, Fedora, Amazon Linux, Scientific Linux
`sudo yum install -y curl gpg gcc gcc-c++ make`

Do nothing for Mac, it's already installed ;-)

Run the following commands to install RVM
`sudo gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3`
`curl -sSL https://get.rvm.io | sudo bash -s stable`
`sudo usermod -a -G rvm `whoami``
You may need to use gpg2 instead of gpg on some systems.
On systems where sudo is configured with secure_path, the shell environment needs to be modified to set rvmsudo_secure_path=1. secure_path is set on most Linux systems, but not on macOS. The following command tries to autodetect whether it is necessary to install rvmsudo_secure_path=1, and only installs the environment variable if it is the code.
`if sudo grep -q secure_path /etc/sudoers; then sudo sh -c "echo export rvmsudo_secure_path=1 >> /etc/profile.d/rvm_secure_path.sh" && echo Environment variable installed; fi`
Reboot
`rvm install ruby`
`rvm --default use ruby`
`gem install bundler --no-rdoc --no-ri`
Now install node.js as it's a dependency for rails

For Ubuntu
`sudo apt-get install -y nodejs &&`
`sudo ln -sf /usr/bin/nodejs /usr/local/bin/node`
For Debian >= 7 (Wheezy or later)
`sudo apt-get update &&`
`sudo apt-get install -y apt-transport-https ca-certificates &&`
`curl --fail -ssL -o setup-nodejs https://deb.nodesource.com/setup_8.x &&`
`sudo bash setup-nodejs &&`
`sudo apt-get install -y nodejs build-essential`

For Red Hat, CentOS, Fedora, Amazon Linux, Scientific Linux
`sudo yum install -y epel-release`
`sudo yum install -y --enablerepo=epel nodejs npm`

Change directory into where you want the code
In that directory, run the following
`git clone https://github.com/Megan-Ralph/AceClan.git`
`cd AceClan`
`bundle install`
`bin/rails db:create`
`bin/rails db:migrate`
`bin/rails server`

Done!
