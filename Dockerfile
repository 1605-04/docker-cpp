FROM ubuntu
RUN apt-get update
RUN apt-get upgrate
RUN apt-get install build-essential -y
