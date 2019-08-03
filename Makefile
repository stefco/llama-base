export DOCKER_REPO := stefco/llama-base
export DOCKERFILE_PATH = Dockerfile-$(DOCKER_TAG)

.PHONY: help
help:
	@echo "Please use \`make <target>\` where <target> is one of:"
	@echo "  help           show this message"
	@echo "  alpine         Docker Cloud-style llama alpine image build"
	@echo "  deb            Docker Cloud-style llama debian image build"
	@echo "  pushalp        docker push the alpine image"
	@echo "  pushdeb        docker push the debian image"

.PHONY: alpine
alpine:
	$(eval export DOCKER_TAG := alpine)
	hooks/build --squash

.PHONY: deb
deb:
	$(eval export DOCKER_TAG := deb)
	hooks/build --squash

.PHONY: pushalp
pushalp:
	$(eval export DOCKER_TAG := alpine)
	docker push $$DOCKER_REPO:$$DOCKER_TAG
	hooks/post_push

.PHONY: pushdeb
pushdeb:
	$(eval export DOCKER_TAG := deb)
	docker push $$DOCKER_REPO:$$DOCKER_TAG
	hooks/post_push
