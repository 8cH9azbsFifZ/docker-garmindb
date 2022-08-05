#FROM debian:bullseye
FROM python
MAINTAINER Gerolf Ziegenhain "gerolf.ziegenhain@gmail.com"

# Install dependencies
RUN pip3 install sqlalchemy requests python-dateutil enum34 progressbar2 lxml 
RUN pip3 install pillow pexpect parso pandocfilters numpy nest-asyncio MarkupSafe kiwisolver
RUN pip3 install fonttools fitfile entrypoints defusedxml decorator debugpy cycler bleach 
RUN pip3 install attrs asttokens traittypes terminado tcxfile stack-data requests-toolbelt packaging
RUN pip3 install garmindb

RUN apt-get update 
RUN apt-get -y install gettext vim
RUN apt-get -y install jq

WORKDIR /root/.GarminDb
#ADD ./GarminConnectConfig.json ./GarminConnectConfig.variables.json
RUN cp /usr/local/lib/python3.10/site-packages/garmindb/GarminConnectConfig.json.example /root/.GarminDb

WORKDIR /root
ADD ./run_garmin ./

ENV USERNAME "test"
ENV PASSWORD "pass"
ENV STARTDATE "01/01/2021"
ENV LATEST "20"
ENV ALL "111"

CMD ["./run_garmin", "--help"]
