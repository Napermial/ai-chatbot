.ONESHELL:

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +

clean-build:
	rm -rf build/
	rm -rf dist/
	rm -rf *.egg-info
	clean-pyc

install:
	pip3.11 install poetry
	poetry install --with test

lint:
	poetry run ruff --check -- --fix

fix:
	poetry run mypy .

flint:
	lint
	fix

test:
	poetry run pytest ./tests

generate-openapi:
	ai-chatbot generate-openapi
