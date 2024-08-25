# docker-garmindb

Run GarminDB in a docker container. 
* Based on https://github.com/tcgoetz/GarminDB. 


# Quickstart

1. replace USERNAME, PASSWORD and any env var you need in `docker-compose.base.yaml`
1. (Optional) If you wish to use deployed (and not a local) image, replace `image` with the [latest version](https://github.com/8cH9azbsFifZ/docker-garmindb/tags)
1. (Optional) If you want to change where your garmin data is downloaded to, change the source mount in `volume` node
1. Download data:
    - if you start anew and have no previous downloads, run `make run_all`
    - if you just need to stay up to date with your garmin data, run `make run_latest`


> Note: `make` commands are just shorthands for docker commands using `Makefile`. If you're using a deployed container, either download the `Makefile` across to your local filesystem along with `docker-compose` files, or just use the full commands from `Makefile`.


# Scheduling

You can schedule your daily run using a tool like `crontab`.

this will make it run every day at 14:00 (read more on cron expressions [here](https://crontab.guru/)) and expects your docker-garmindb repo live in `~/repos/docker-garmindb`. It will also append to `logs.txt` file in your repo folder so you can see what has been happening. Adapt accordingly.
```
(crontab -l; echo "0 14 * * * cd ~/repos/docker-garmindb/ && make run_latest >> ~/repos/docker-garmindb/logs.txt") | crontab -
```