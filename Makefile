.PHONY: all
all: install

.PHONY: install
install:
	@echo "=> Installing Git config"
	mkdir -p ~/.config/git
	stow -Rt ~/.config/git git 
	@echo "=> Installing Vim config"
	mkdir -p ~/.config/nvim
	stow -Rt ~/.config/nvim vim
	git submodule update --init --recursive
	@echo "=> Installing tmux config"
	mkdir -p ~/.config/tmux
	stow -Rt ~/.config/tmux tmux
	@echo "=> Installing NewsBoat config"
	mkdir -p ~/.config/newsboat	
	stow -Rt ~/.config/newsboat newsboat
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

