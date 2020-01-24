# Makefile for telnyx-2fa Service

# VARIABLES

# Change these variables.
service := telnyx-2fa
tag := red

python_version := 3.8
pip_version := 19.3.1
# piptools_version := 4.2.0

# Generated variables.
main_image := registry:5000/jenkins/$(service):$(tag)
docker_build_args = \
	--build-arg GIT_COMMIT=$(shell git show -s --format=%H) \
	--build-arg GIT_COMMIT_DATE="$(shell git show -s --format=%ci)" \
	--build-arg IMAGE_NAME=$(service) \
	--build-arg BUILD_DATE=$(shell date -u +"%Y-%m-%dT%T.%N%Z") \
	--build-arg BUILD_URL=$(BUILD_URL) \
	--build-arg BUILD_NUMBER=$(BUILD_NUMBER) \
	--build-arg REQ_PYTHON_VERSION=$(python_version) \
	--build-arg REQ_PIP_VERSION=$(pip_version)

# TARGETS

.PHONY: test build push

all: build

test: build
	docker run --entrypoint ./run-tests.sh telnyx-2fa

build:
	docker build $(docker_build_args) -t $(main_image) .

push:
	docker push $(main_image)
