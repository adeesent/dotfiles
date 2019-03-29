.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:
	@echo "=> Installing Git config"
	stow -Rt ~ git 
	@echo "=> Installing Vim config"
	mkdir -p ~/.vim
	stow -Rt ~/.vim vim
	git submodule update --init --recursive
	@echo "=> Installing tmux config"
	stow -Rt ~ tmux
	@echo "=> Installing NewsBoat config"
	stow -Rt ~ newsboat
	@echo "=> Installing i3 configs"
	stow -Rt ~/.config/i3 i3
	stow -Rt ~/.config/i3status i3status

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh

