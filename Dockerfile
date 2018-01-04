FROM node:8.6

WORKDIR /code

RUN npm install serverless -g \
 && npm install serverless-step-functions

RUN apt-get update \
 && apt-get install -y curl libunwind8 gettext apt-transport-https \
 && curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg \
 && mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg \
 && sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-jessie-prod jessie main" > /etc/apt/sources.list.d/dotnetdev.list' \
 && apt-get update \
 && apt-get install -y dotnet-sdk-2.0.0

RUN echo 'deb http://ftp.de.debian.org/debian testing main' >> /etc/apt/sources.list \
 && echo 'APT::Default-Release "stable";' | tee -a /etc/apt/apt.conf.d/00local \
 && apt-get update \
 && apt-get -t testing install -y python3.6

VOLUME /code
