# dotfiles

## HOW TO INSTALL

### install git

* install brew
* `brew install git`

### install zsh

* `brew install zsh`
* `brew install tmux`
* `echo '/usr/local/bin/zsh' >> /etc/shells`
* `chsh -s /usr/local/bin/zsh`
* reboot

### run setup shell scripts

* `cd dotfiles`
* `sh installPowerLine.sh`
* `sh fontInstaller.sh`
* `sh dotfilesLink.sh`

### install git-foresta

* `mkdir ~/.bin`
* `curl -L https://github.com/takaaki-kasai/git-foresta/raw/master/git-foresta -o ~/.bin/git-foresta && chmod +x ~/.bin/git-foresta
`