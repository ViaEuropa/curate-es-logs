FROM python:2.7-alpine

RUN pip install elasticsearch-curator

COPY config.yml .
COPY actions.yml .

ENV OLDER_THAN_IN_DAYS="30"
ENV ELASTICSEARCH_HOST=logs.stage.brikks.org

CMD ["curator", "--dry-run", "--config", "config.yml", "actions.yml"]
