container_name=sbi-fetcher
.PHONY: debug
debug:
	docker-compose -f build/docker-compose.yml up

.PHONY: run
run:
	docker-compose -f build/docker-compose.yml up -d

.PHONY: push
push:
	docker build -t ghcr.io/azuki774/sbi-fetcher:nightly -f build/Dockerfile .
	docker push ghcr.io/azuki774/sbi-fetcher:nightly
