export DOCKER_REPO := stefco/llama-base
export DOCKERFILE_PATH = Dockerfile-$(DOCKER_TAG)

.PHONY: help
help:
	@echo "Please use \`make <target>\` where <target> is one of:"
	@echo "  help           show this message"
	@echo "  deb            Docker Cloud-style llama debian image build"
	@echo "  pushdeb        docker push the debian image"
	@echo "  bumppatch      bump version to next patch version (adds commit/tag)"
	@echo "  bumpminor      bump version to next minor version (adds commit/tag)"
	@echo "  bumpmajor      bump version to next major version (adds commit/tag)"

.PHONY: bumpmajor
bumpmajor:
	bump2version major

.PHONY: bumpminor
bumpminor:
	bump2version minor

.PHONY: bumppatch
bumppatch:
	bump2version patch

# .PHONY: alpine
# alpine:
# 	$(eval export DOCKER_TAG := alpine)
# 	hooks/build # --squash

.PHONY: deb
deb:
	$(eval export DOCKER_TAG := deb)
	hooks/build # --squash

# .PHONY: pushalpine
# pushalpine:
# 	$(eval export DOCKER_TAG := alpine)
# 	docker push $$DOCKER_REPO:$$DOCKER_TAG
# 	hooks/post_push

.PHONY: pushdeb
pushdeb:
	$(eval export DOCKER_TAG := deb)
	docker push $$DOCKER_REPO:$$DOCKER_TAG
	hooks/post_push
	docker tag $$DOCKER_REPO:$$DOCKER_TAG $$DOCKER_REPO:latest
	docker push $$DOCKER_REPO:latest
