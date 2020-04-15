FROM debian:buster-slim
MAINTAINER Gerolf Ziegenhain "gerolf.ziegenhain@gmail.com"

# Install dependencies
RUN apt-get update
RUN apt-get -y install build-essential git python python-pip gettext 
#RUN apt-get -y install build-essential git python3 python-pip3 gettext 
RUN apt-get -y install vim
RUN pip install sqlalchemy requests python-dateutil enum34 progressbar2 lxml


# The makefile does not work properly, so force manual installation
WORKDIR /usr/src/app
ARG repo=8cH9azbsFifZ
#ARG repo=tcgoetz # Alternative 
RUN git clone "https://github.com/${repo}/GarminDB.git"
RUN git clone https://github.com/$repo/python-tcxparser.git
RUN git clone https://github.com/$repo/Fit.git
RUN git clone https://github.com/$repo/utilities.git
RUN rm -rf GarminDB/Fit ; mv Fit GarminDB
RUN rm -rf GarminDB/utilities ; mv utilities GarminDB
RUN cd python-tcxparser ; python setup.py install

# Install time for use of Makefile as provided by tcgoetz
RUN apt-get -y install time

# Prepare the configuration scripts
ADD ./GarminConnectConfig.json ./
WORKDIR /usr/src/app/GarminDB
ADD ./run_garmin ./

CMD ["./run_garmin", "--help"]
