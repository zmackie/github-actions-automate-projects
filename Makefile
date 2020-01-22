IMAGE_NAME=github-actions-automate-projects
IMG_REPO=gcr.io/cncf-buildpacks-ci/pm
TAG_NAME ?= latest
BUILDER=cloudfoundry/cnb:tiny

#
# Build Dockerfile and push the image to DockerHub
#
.PHONY: publish
publish: build-local --publish

#
# Build Docker image
#
.PHONY: build-local
build-local:
	pack build -v ${IMG_REPO}/${IMAGE_NAME}:$(TAG_NAME) --builder ${BUILDER}

.PHONY: build-publish
build-publish:
	pack build -v ${IMG_REPO}/${IMAGE_NAME}:${TAG_NAME} --builder ${BUILDER} --publish

# #
# # Build Docker image with DockerHub repository
# #
# .PHONY: docker-tag
# docker-tag:
# 	docker image tag $(IMAGE_NAME):$(TAG_NAME) $(DOCKER_REPO):$(TAG_NAME)
# #
# # Publish Docker image and tags on DockerHub
# #
# .PHONY: docker-publish
# docker-publish:
# 	docker push $(DOCKER_REPO):$(TAG_NAME)
