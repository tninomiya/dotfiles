# dotfiles

## HOW TO INSTALL

### install git

* install brew
* `brew install git`

### install zsh

* `brew install zsh`
* `echo '/usr/local/bin/zsh' >> /etc/shells`
* `chsh -s /usr/local/bin/zsh`
* reboot

### run setup shell scripts

* `cd dotfiles`
* `sh installPowerLine.sh`
* `sh fontInstaller.sh`
* `sh dotfilesLink.sh`
