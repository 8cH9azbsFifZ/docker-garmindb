VER=1.1.0
build:
	docker build . -t garmindb -t asdlfkj31h/garmindb:${VER} -t asdlfkj31h/garmindb:latest
run_all: cleanup build
	docker-compose -f docker-compose.base.yaml -f docker-compose.all.yaml up
run_latest: cleanup build
	docker-compose -f docker-compose.base.yaml -f docker-compose.latest.yaml up
cleanup:
	docker-compose -f docker-compose.base.yaml -f docker-compose.all.yaml down --volumes
	docker-compose -f docker-compose.base.yaml -f docker-compose.latest.yaml down --volumes
	docker rmi garmindb 
	docker rmi asdlfkj31h/garmindb:${VER} 
	docker rmi asdlfkj31h/garmindb:latest
