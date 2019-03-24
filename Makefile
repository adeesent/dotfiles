.PHONY: all
all: dotfiles

.PHONY: dotfiles
dotfiles:
	@echo "=> Installing Git config"
	stow -Rt ~ git 
	@echo "=> Installing Vim config"
	stow -Rt ~ vi
	@echo "=> Installing tmux config"
	stow -Rt ~ tmux
	@echo "=> Installing NewsBoat config"
	stow -Rt ~ newsboat
	@echo "=> Installing i3 config"
	stow -Rt ~/.config i3

.PHONY: test
test: shellcheck ## Runs all the tests on the files in the repository.

.PHONY: shellcheck
shellcheck: ## Runs the shellcheck tests on the scripts.
	docker run --rm -i $(DOCKER_FLAGS) \
		--name df-shellcheck \
		-v $(CURDIR):/usr/src:ro \
		--workdir /usr/src \
		r.j3ss.co/shellcheck ./test.sh

