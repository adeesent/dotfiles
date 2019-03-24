.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:
	@echo "=> Installing Git config"
	stow -Rt ~ git 
	@echo "=> Installing Vim config"
	stow -Rt ~ vi
