export DOCKER_REPO := stefco/llama-base
export DOCKERFILE_PATH = Dockerfile-$(DOCKER_TAG)

.PHONY: help
help:
	@echo "Please use \`make <target>\` where <target> is one of:"
	@echo "  help           show this message"
	@echo "  alpine         Docker Cloud-style llama alpine image build"
	@echo "  deb            Docker Cloud-style llama debian image build"
	@echo "  deb-datagrid   Docker Cloud-style LIGO DataGrid debian build"

.PHONY: alpine
alpine:
	$(eval export DOCKER_TAG := alpine)
	hooks/build

.PHONY: deb
deb:
	$(eval export DOCKER_TAG := deb)
	hooks/build

.PHONY: deb-datagrid
deb-datagrid:
	$(eval export DOCKER_TAG := deb-datagrid)
	hooks/build
