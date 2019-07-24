export DOCKER_REPO := stefco/llama-base
export DOCKERFILE_PATH = Dockerfile-$(DOCKER_TAG)

.PHONY: help
help:
	@echo "Please use \`make <target>\` where <target> is one of:"
	@echo "  help           show this message"
	@echo "  alpine         Docker Cloud-style llama alpine image build"
	@echo "  deb            Docker Cloud-style llama debian image build"
	@echo "  deb-datagrid   Docker Cloud-style LIGO DataGrid debian build"
	@echo "  pushalp        docker push the alpine image"
	@echo "  pushdeb        docker push the debian image"
	@echo "  pushldg        docker push the deb-datagrid image"

.PHONY: alpine
alpine:
	$(eval export DOCKER_TAG := alpine)
	hooks/build --squash

.PHONY: deb
deb:
	$(eval export DOCKER_TAG := deb)
	hooks/build --squash

.PHONY: deb-datagrid
deb-datagrid:
	$(eval export DOCKER_TAG := deb-datagrid)
	hooks/build --squash

.PHONY: pushalp
pushalp:
	$(eval export DOCKER_TAG := alpine)
	hooks/post_push

.PHONY: pushdeb
pushdeb:
	$(eval export DOCKER_TAG := deb)
	hooks/post_push

.PHONY: pushldg
pushldg:
	$(eval export DOCKER_TAG := deb-datagrid)
	hooks/post_push
