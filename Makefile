.PHONY: all
all: install

.PHONY: install
install:
	@echo "=> Installing bin"
	mkdir -p ~/.local/bin
	stow -Rt ~/.local/bin bin 
	@echo "=> Installing sh config"
	mkdir -p ~/.config/bash
	stow -Rt ~/.config/bash sh 
	@echo "=> Installing Git config"
	mkdir -p ~/.config/git
	stow -Rt ~/.config/git git 
	@echo "=> Installing Vim config"
	mkdir -p ~/.config/nvim
	stow -Rt ~/.config/nvim vim
	@echo "=> Installing tmux config"
	mkdir -p ~/.config/tmux
	stow -Rt ~/.config/tmux tmux
	@echo "=> Installing NewsBoat config"
	mkdir -p ~/.config/newsboat	
	stow -Rt ~/.config/newsboat newsboat

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh

