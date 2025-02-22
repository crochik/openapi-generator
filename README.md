# Hack
Hacked version of generator to generte a dart client with support for inheritance. 

## Build code
```
./run-in-docker.sh mvn package -DskipTests
```

## To build docker container
```
docker buildx build --pull --rm -f "Dockerfile" -t crochik/openapigenerator:amd64 "." --platform linux/amd64
```