deps:
	pip install -r requirements.txt; \
	pip install -r test_requirements.txt
run:
	python main.py
.PHONY:test
test:
	PYTHONPATH=. py.test --verbose -s
lint:
	flake8 hello_world test
docker_build:
	docker build -t hello-world-printer .
USERNAME=KasiaPodrazka
TAG=$(USERNAME)/hello-world-printer-k3
docker_push: docker_build
	@docker login --username $(USERNAME) --password $${Kulka.444}; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;