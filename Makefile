VER=2.0.0
build:
	[ -z "$(GARMIN_USERNAME)" ] && { echo "Error: GARMIN_USERNAME is not set or is empty."; exit 1; } || [ -z "$(GARMIN_PASSWORD)" ] && { echo "Error: GARMIN_PASSWORD is not set or is empty."; exit 1; }
	docker build . -t garmindb -t pflajszer/garmindb:${VER} -t pflajszer/garmindb:latest --build-arg USERNAME=$(GARMIN_USERNAME) --build-arg PASSWORD=$(GARMIN_PASSWORD)
run:
	docker run docker.io/pflajszer/garmindb:latest
cleanup:
	docker image rm pflajszer/garmindb:latest -f
	docker image rm pflajszer/garmindb:${VER} -f