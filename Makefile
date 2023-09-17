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
	docker build -t myapp1 .
deploy:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 185183796631.dkr.ecr.us-east-1.amazonaws.com
	docker build -t ecr-trial .
	docker tag ecr-trial:latest 185183796631.dkr.ecr.us-east-1.amazonaws.com/ecr-trial:latest
	docker push 185183796631.dkr.ecr.us-east-1.amazonaws.com/ecr-trial:latest

all: install lint format test build deploy
