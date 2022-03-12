VERSION_API=rc
container_name=sbi-fetcher
.PHONY: build
build:
	docker build -t ghcr.io/azuki774/$(container_name):$(VERSION_API) -f build/Dockerfile .

.PHONY: push
push:
	docker push ghcr.io/azuki774/$(container_name):$(VERSION_API)

.PHONY: run
run:
	docker-compose -f build/docker-compose.yml up --build -d
