.PHONY: help dockerize up shell shutdown

help:
	@echo 'Available targets:'
	@echo '  make dockerize'
	@echo '  make shell'
	@echo '  make shutdown'

dockerize:
	docker-compose up --build

up:
	docker-compose up

shell:
	docker-compose exec web sh

shutdown:
	docker-compose down
