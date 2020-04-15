build:
	docker build . -t garmindb
	docker build . -t asdlfkj31h/garmindb:1.0.8.2

push:
	docker push asdlfkj31h/garmindb:1.0.8.2
