REGISTRY ?= docker.io
IMAGE ?= bborbe/atlassian-jira-software
ifeq ($(BUILD_VERSION),)
	BUILD_VERSION := $(shell git describe --tags `git rev-list --tags --max-count=1`)
endif
ifeq ($(VENDOR_VERSION),)
	VENDOR_VERSION := $(shell curl -s https://my.atlassian.com/download/feeds/jira-software.rss | grep -Po "(\d{1,2}\.){2,3}\d" | uniq)
endif
VERSION := $(VENDOR_VERSION)-$(BUILD_VERSION)

default: build

build:
	docker build --build-arg VENDOR_VERSION=$(VENDOR_VERSION) --no-cache --rm=true -t $(REGISTRY)/$(IMAGE):$(VERSION) .

upload:
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)

clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION)  || true

version:
	@echo $(VERSION)
