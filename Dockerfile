FROM python:3.11

# Install dependencies
RUN pip3 install garmindb
RUN apt-get update && apt-get -y install jq

WORKDIR /root/.GarminDb
RUN cp /usr/local/lib/python3.11/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ARG USERNAME
ENV USERNAME=${USERNAME}
ARG PASSWORD
ENV PASSWORD=${PASSWORD}
ARG STARTDATE
ENV STARTDATE=${STARTDATE}
ARG LATEST=30
ENV LATEST=${LATEST}
ARG ALL=3000
ENV ALL=${ALL}
