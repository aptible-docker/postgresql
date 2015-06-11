DOCKER = docker
TAGS = 9.4

all: release

release: $(TAGS)
	$(DOCKER) push quay.io/aptible/postgresql

build: $(TAGS)

.PHONY: $(TAGS)
$(TAGS):
	$(DOCKER) build -t quay.io/aptible/postgresql:$@ -f Dockerfile-$@ .
