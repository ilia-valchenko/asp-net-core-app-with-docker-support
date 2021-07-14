# asp-net-core-app-with-docker-support
You can you the commands below to build an image and run a container:

`docker build -t dummy-app-image-v1 .`

`docker run -d -p 42900:80 --name dummy-app-container-v1 dummy-app-image-v1`