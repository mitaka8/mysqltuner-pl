.PHONY: docker
docker:
	docker buildx build --builder mybuilder --no-cache --push --platform linux/amd64,linux/arm64 --no-cache -t mitaka8/mysqltuner-pl:latest .

.PHONY: publish
publish:
	docker push mitaka8/mysqltuner-pl:latest
