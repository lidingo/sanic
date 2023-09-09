run: setup
	venv/bin/sanic a:app -H 0.0.0.0

setup: venv/reqs.txt

venv/reqs.txt: venv reqs.txt
	venv/bin/pip install -U pip
	venv/bin/pip install -r reqs.txt
	cp reqs.txt venv/

venv:
	python -m venv venv

clean:
	rm -rf venv

build: clean
	docker build -t hn4 .
	docker image prune --force

docker-run:
	docker run --rm --init -p 8000:8000 hn4
