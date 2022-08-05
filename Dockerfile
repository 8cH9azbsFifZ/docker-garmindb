FROM python
MAINTAINER Gerolf Ziegenhain "gerolf.ziegenhain@gmail.com"

# Install dependencies
RUN pip3 install garmindb

RUN apt-get update 
RUN apt-get -y install jq

WORKDIR /root/.GarminDb
RUN cp /usr/local/lib/python3.10/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ENV USERNAME "test"
ENV PASSWORD "pass"
ENV STARTDATE "01/01/2021"
ENV LATEST "20"
ENV ALL "111"

CMD ["./run_garmin"]
