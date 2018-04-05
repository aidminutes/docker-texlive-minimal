# The binary to build (just the basename).
BIN := docker-texlive-minimal

# This repo's root import path (under GOPATH).
PKG := github.com/aidminutes/docker-texlive-minimal
# Where to push the docker image.
REGISTRY ?= registry.eu-de.bluemix.net/aidminutes

# Which architecture to build - see $(ALL_ARCH) for options.
ARCH ?= amd64

# This version-strategy uses git tags to set the version string
VERSION := $(shell date +"%Y-%m-%d")
#
# This version-strategy uses a manual value to set the version string
#VERSION := 1.2.3

###
### These variables should not need tweaking.
###

IMAGE := $(REGISTRY)/$(BIN)-$(ARCH)
.PHONY: build

build:
	@echo "building: $@"
	@docker build -t $(IMAGE):$(VERSION) .
	@echo "container: $(IMAGE):$(VERSION)"

push: build push-name
	@docker push $(IMAGE):$(VERSION)

version:
	@echo $(VERSION)

test: build

push-name:
	@echo "pushed: $(IMAGE):$(VERSION)"