# script file for installing oh-my-zsh

get_plugins() {
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
}



ostype=$(uname -s)

if [ostype = "Darwin"]; then 
	brew install zsh

	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.zshrc
	source ~/.zshrc
	get_plugins

elif [ostype = "Linux"]; then
	paru -S zsh
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	source ~/.zshrc
	get_plugins


fi


