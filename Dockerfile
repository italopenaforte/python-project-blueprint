FROM python:3.11.4-slim
COPY ["/", "/app/"]
RUN apt-get update && \
    apt-get -y install awscli gcc file curl && \
    pip install --no-cache-dir -r /app/requirements.txt && \
    apt-get -y autoremove gcc file && \
    apt-get clean && \
    python -m compileall -f /app/

CMD ["/app/entrypoint.sh"]
