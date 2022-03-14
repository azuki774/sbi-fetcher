container_name=sbi-fetcher
.PHONY: debug
debug:
	docker-compose -f build/docker-compose.yml up

.PHONY: run
run:
	docker-compose -f build/docker-compose.yml up -d
