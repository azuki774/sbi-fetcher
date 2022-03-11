VERSION_API=rc
container_name=sbi-fetcher
.PHONY: build
build:
	docker build -t ghcr.io/azuki774/$(container_name):$(VERSION_API) -f build/Dockerfile .

.PHONY: run
run:
	docker run --rm ghcr.io/azuki774/sbi-fetcher:rc
