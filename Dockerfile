FROM python:3.11.4-slim

RUN mkdir -p /srv/app

WORKDIR /srv/app

COPY . /srv/app

RUN apt-get update && \
    pip install --no-cache-dir -r /srv/app/requirements.txt && \
    apt-get clean && \
    python -m compileall -f /srv/app/

CMD ["/srv/app/entrypoint.sh"]
