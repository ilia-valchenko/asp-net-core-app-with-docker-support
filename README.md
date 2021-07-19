# ASP .NET Core app with Docker support
You can you the commands below to build an image and run a container:

`docker build -t dummy-app-image-v1 .`

`docker run -d -p 42900:80 --name dummy-app-container-v1 dummy-app-image-v1`

Use the power of Docker compose by running the command below if you want to run a few container:

`docker-compose up -d`

Use the credentials below to connect to the instance of SQL server
- Server name: 127.0.0.1,1433
- Login: sa
- Password: Your_password123

## Continuous Integration
- Continuous integration service: Travis CI
- Cloud platform: Heroku

## Test header