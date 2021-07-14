# See https://aka.ms/containerfastmode to understand how Visual Studio uses this Dockerfile to build your images for faster debugging.

# This is just a list of commands that are sent to the docker engine. The docker engine reads the commands one by one from
# from the top to bottom. The docker file is used to create a docker image.

# FROM command sets base (parent) image.
# The base image is stored in the official Docker repository.
FROM mcr.microsoft.com/dotnet/aspnet:5.0 AS base

# LABEL command adds metadata to the docker image.
# LABEL maintainer="ilya_valchanka@gmail.com"

# WORKDIR command sets a working directory for the next command.
WORKDIR /app

# EXPOSE command says that the provided port has to be opened.
EXPOSE 80

FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build
WORKDIR /src

# COPY commands copies files and folders to a docker container.
COPY ["dymmy-asp-net-core-web-api.csproj", "."]

# RUN command executes a command. It's used for installing packages in a docker container.
RUN dotnet restore "./dymmy-asp-net-core-web-api.csproj"

COPY . .
WORKDIR "/src/."
RUN dotnet build "dymmy-asp-net-core-web-api.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "dymmy-asp-net-core-web-api.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .

# ENTRYPOINT command provides a command (with arguments) which will be executed during container execution.
ENTRYPOINT ["dotnet", "dymmy-asp-net-core-web-api.dll"] 

# ENV command sets system variables
# VOLUME command is used for mounting a persistent storage.