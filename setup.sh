#bin/bash

# Update Package List
apt update

# Update System Packages
apt upgrade -y

# exiftool
apt install exiftool -y

# curl
apt install curl -y

# git
apt install git -y

# chrome
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
apt update
apt install google-chrome-stable -y

# snap
apt get install snapd -y

# snap apps
snap install code --classic \
    spotify \
    discord \
    slack --classic

declare -a vscodeExtensions=(
    "dbaeumer.vscode-eslint"
    "MS-vsliveshare.vsliveshare"
    "esbenp.prettier-vscode"
    "shd101wyy.markdown-preview-enhanced"
    "DavidAnson.vscode-markdownlint"
    "EditorConfig.EditorConfig"
    "Syler.sass-indented"
    "msjsdiag.vscode-react-native"
    "burkeholland.simple-react-snippets"
    "ms-vscode.atom-keybindings"
    "anseki.vscode-color"
    "shakram02.bash-beautify"
    "vscode-icons-team.vscode-icons"
    "mikestead.dotenv"
    "ldez.ignore-files"
    "ms-azuretools.vscode-docker"
)

for i in "${vscodeExtensions[@]}"; do
    code --install-extension $i
done

# terminator
apt install terminator -y

# skype
wget https://go.skype.com/skypeforlinux-64.deb
apt install ./skypeforlinux-64.deb

# nvm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash
source ~/.bashrc

# node/npm
nvm install v10.16.3
nvm use v10.16.3
nvm alias default v10.16.3

# yarn
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
apt update && apt install yarn -y

# simple screen recorder
add-apt-repository ppa:maarten-baert/simplescreenrecorder -y
apt update
apt install simplescreenrecorder -y

#cmatrix
apt install cmatrix -y

# react-native-cli/watchman(inotify)
npm install -g react-native-cli
sudo apt install inotify-tools -y

# java - jdk8
add-apt-repository ppa:webupd8team/java -y
apt update
apt install openjdk-8-jdk -y
export JAVA_HOME=/usr/lib/jvm/java-8-*
java -version

# android studio
add-apt-repository ppa:maarten-fonville/android-studio -y
apt update
apt install android-studio -y

# anyDesk
https://download.anydesk.com/linux/anydesk_5.1.1-1_amd64.deb -O anydesk.deb
dpkg -i anydesk.deb
apt install -f

# vitrualBox
wget https://download.virtualbox.org/virtualbox/6.0.12/VirtualBox-6.0.12-133076-Linux_amd64.run -O virtualbox.run
chmod +x virtualbox.run
./virtualbox.run

# insomnia
echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" | tee -a /etc/apt/sources.list.d/insomnia.list
wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc | apt-key add - -y

# gimp
add-apt-repository ppa:otto-kesselgulasch/gimp -y
apt update
apt install gimp gimp-gmic gmic -y
apt install gimp-plugin-registry -y

# Docker
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
apt update
apt install docker-ce -y
usermod -aG docker ${USER}
usermod -aG docker ${USER}

# Docker compose
curl -L https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose

# list programs
clear
(curl --version | grep "curl") && printf "\n"
google-chrome-stable --version && printf "\n"
printf "VS Code: " && code --version && printf "\n"
terminator --version && printf "\n"
printf "spotify: " && (snap info --verbose spotify | grep "stable:") && printf "\n"
printf "discord: " && (snap info --verbose discord | grep "stable:") && printf "\n"
printf "nvm: " && nvm --version && printf "\n"
printf "node: " && node --version && printf "\n"
printf "npm: " && npm --version && printf "\n"
printf "yarn: " && yarn --version && printf "\n"
(simplescreenrecorder --version | grep "SimpleScreenRecorder") && printf "\n"
printf "\n" && (cmatrix -V | grep "CMatrix") && printf "\n"
(react-native --version | grep "react-native-cli:") && printf "\n"
java -version && printf "\n"
printf "gimp: " && gimp --version && printf "\n"
printf "gimp: " && docker --version && printf "\n"
printf "gimp: " && docker-compose --version && printf "\n"
