FROM python:3.11

# Install dependencies
RUN pip3 install garmindb
RUN apt-get update && apt-get -y install jq

WORKDIR /root/.GarminDb
RUN cp /usr/local/lib/python3.11/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ARG USERNAME
ARG PASSWORD
ENV USERNAME $USERNAME
ENV PASSWORD $PASSWORD
ENV STARTDATE "01/01/2019"
ENV LATEST 30
ENV ALL 2000

CMD ["./run_garmin"]
