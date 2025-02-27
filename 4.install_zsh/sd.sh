#install zsh

echo $SHELL;
cat /etc/shells ;
yum -y install zsh;
chsh -s /bin/zsh;
yum install -y wget git ;
wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh;
cd ~/.oh-my-zsh/plugins;
wget http://mimosa-pudica.net/src/incr-0.2.zsh;
source incr*.zsh;
# install oh-my-zsh

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# zsh-Z

git clone https://github.com/agkozak/zsh-z $ZSH_CUSTOM/plugins/zsh-z

# zsh-fast-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git
# zsh-autocomplete

git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf


sed -i 's\robbyrussell\cypher\g' ~/.zshrc;

sed -i 's\(git)\(fzf git sudo history-substring-search colored-man-pages zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete zsh-z)\g' ~/.zshrc;

source ~/.zshrc;

#vim ~/.zshrc
