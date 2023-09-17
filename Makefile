install:
	pip install --upgrade pip &&\
		pip install -r requirements.txt
lint:
	pylint --disable=R,C hello.py

format:
	black *.py

test:
	python -m pytest -vv --cov=hello test_hello.py
build:
	docker build --tag=hello .
deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 185183796631.dkr.ecr.us-east-1.amazonaws.com
	docker build -t test .
	docker tag test:latest 185183796631.dkr.ecr.us-east-1.amazonaws.com/test:latest
	docker push 185183796631.dkr.ecr.us-east-1.amazonaws.com/test:latest
all: install lint format test build deploy
