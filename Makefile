#
# Parameters
#

# Name of the docker executable
DOCKER = docker

# Docker organization to pull the images from
ORG = jcfr

# Name of image
IMAGE = travis-cli

build:
	docker build \
		--build-arg IMAGE=$(IMAGE) \
		--build-arg VCS_REF=`git rev-parse --short HEAD` \
		--build-arg VCS_URL=`git config --get remote.origin.url` \
		--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
		-t $(ORG)/$(IMAGE) .

push:
	docker push $(ORG)/$(IMAGE)
