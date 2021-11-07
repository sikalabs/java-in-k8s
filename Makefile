jar:
	docker run -it \
		-e MAVEN_OPTS="-Dmaven.repo.local=/app/.m2/repository" \
		-w /app \
		-v ${PWD}:/app \
		openjdk:11.0.13-oraclelinux8 \
		./mvnw package -DskipTests

jib:
	docker run -it \
		-e MAVEN_OPTS="-Dmaven.repo.local=/app/.m2/repository" \
		-w /app \
		-v ${PWD}:/app \
		-v ${HOME}/.docker:/root/.docker \
		openjdk:11.0.13-oraclelinux8 \
		./mvnw compile jib:build -Dimage=elmariofredo/java-in-k8s

image:
	docker build . -t example

run:
	docker run -p8080:8080 example

all:
	make jar
	make image
	make run

clean:
	rm -rf target
	docker rmi -f $(docker images -q)
	docker rmi -f $(docker images -q)
