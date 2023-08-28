FROM python:3.11.5-bookworm

WORKDIR /srv

RUN pip3 install poetry==1.6
RUN poetry config virtualenvs.create false

ADD pyproject.toml poetry.lock ./

RUN poetry install --no-root

ADD README.md ./

ADD ai_chatbot ./ai_chatbot

RUN poetry install --only-root

CMD ["poetry", "run", "ai-chatbot", "run"]