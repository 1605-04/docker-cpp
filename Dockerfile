FROM ubuntu
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install build-essential -y
