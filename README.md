# MAADbox
The vagrant box for development with the MAAD stack (MySQL + Apache + AngularJS + Django)
This box is heavily based off of the work that I've been doing with Booksmart on our development environment, as well as some vagrant tricks I learned while working at RJMetrics.

### Goals and Dependencies

#### Goals
The goals of creating this box are:
- Setup our shared development environment
- Realize the benefits of a virtual development environment
- Create a baseline box that can be used for setting up a MAAD stack in order to jump-start new web-projects

#### Dependencies
Before running the setup instructions, please satisfy the following dependencies on your machine:
- [vagrant](http://www.vagrantup.com/) - download and install from website ( > 1.7)
- [virtual box](https://www.virtualbox.org/wiki/Downloads) - download and install from website. **IMPORTANT: Make sure to download the website version.  The apt-get version will not work!**
- [chef-dk](https://downloads.chef.io/chef-dk/) - download and install from website
- [sshfs](http://fuse.sourceforge.net/sshfs.html) - This should also be available via `apt-get` if you're on Linux
- [git](https://www.github.com) (Be use to add the SSH key from your new computer to your [GitHub account](https://github.com/settings/ssh).)
- More than 4GB of RAM on your workstation. If you have a less than 4GB of RAM on your laptop, you'll need to manually modify the config.vm.memory value in the Vagrantfile to account for this


### Setup

#### First-time users
##### Clone the repo
 - Clone this repository or one of its branches (git clone git@github.com:Booksmart/MAADbox.git)
 - Enable [ssh agent forwarding](https://help.github.com/articles/using-ssh-agent-forwarding) from your host by running `ssh-add`. If this complains in any way, run `ssh-agent $SHELL` first
 - For Windows users, try running `eval $(ssh-agent)` and then `ssh-add` in Git Bash

##### Add host aliases
 - You will only need to ever run this once on your host machine.  This will allow you to access development URL's on your host machine:
```
$ sudo sh -c "cat .hostaliases >> /etc/hosts"
```
- Be sure to set `user.email` and `user.name` in your `git config --global`. This project depends on them being properly set.
```
$ git config --global user.name "John Doe"
$ git config --global user.email johndoe@example.com
```

#### Install vagrant dependencies
You first need to install chef and berkshelf for vagrant.  We've made this easy to do.  Simply run
```
$ . install.sh
```
- If vagrant dependencies change you'll simply need to run this again

**For Windows users**, instead of the above, in powershell navigate to the MAADbox directory and run:
```
> & .\install.ps1
```
- NOTE: If you get an error about scripts being disabled, reopen powershell as an
administrator and run `Set-ExecutionPolicy Unrestricted`, then try again 

#### Building the MAADbox
##### Some things to note first:
- The first time your VM builds, it will take ~10-20 minutes, patience is a virtue.
- During provisioning, the terminal text will probably spit out red text.  This is an issue with the tty color not changing back, and at the moment we don't know the fix for it.  Don't worry about this, chances are things are still installing correctly.
- Don't build one VM while running another. It will crash your workstation.
- Even if you ran ssh-add in the past in a different shell from one you may using now, you may still have to enable ssh-agent, especially if you are logging in remotely. ssh-agent $SHELL; ssh-add should take care of this.


##### Building/running the VM
To actually build the VM, navigate to the top of this repo directory (where the Vagrantfile is) and run
```
$ vagrant up
```

##### Getting onto the VM
If you just completed provisioning (i.e: You just ran `vagrant up`), add the ssh configuration to your machine for easy ssh access:
```
$ vagrant ssh-config --host maadbox >> ~/.ssh/config
```
 - Note: If you want to change `maadbox` to something else, go ahead, just make sure to replace `maadbox` in all other ssh commands with your desired name.

Since the VM is essentially another machine running on your host machine, we'll access it through ssh:
```
$ ssh maadbox
```
- All code (by default) will live at /opt/code

##### Keeping your VM up to date
From the root of the vagrant folder on your host machine, run:
```
$ . update_utils.sh
```
This will copy all of the files in `bin/` and `provision/` up to the VM.
 - Note: This will overwrite any changes that you've made to these files on the VM

##### Setting up SSHFS
SSHFS essentially lets you use SSH to tunnel a folder on a VM to your host machine.  First, make a folder somewhere on your host machine that you want the repos to be forwarded to, then run
```
sshfs maadbox:/opt/code /path/to/folder/on/host/machine
```
(You may wanna add an alias for this to your .bashrc)
