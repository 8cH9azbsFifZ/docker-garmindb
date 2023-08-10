VER=1.0.15
build:
	docker build . -t garmindb -t asdlfkj31h/garmindb:${VER} -t asdlfkj31h/garmindb:latest

push:
	docker push asdlfkj31h/garmindb:${VER}
	docker push asdlfkj31h/garmindb:latest
