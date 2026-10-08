FROM python:3.12-slim
WORKDIR /app
RUN apt-get update && apt-get install -y --no-install-recommends unzip curl \
 && rm -rf /var/lib/apt/lists \
 && pip install --no-cache-dir fastapi==0.109.0 uvicorn==0.27.0 pydantic==2.5.3
RUN curl -L -o /tmp/dyad.zip "https://github.com/cirezenitram1986-code/commons-drop/releases/download/V1.0.0/dyad-app-v1.zip" \
 && unzip -q /tmp/dyad.zip -d /app && rm /tmp/dyad.zip
WORKDIR /app/dyad-app-v1
CMD ["sh", "-c", "uvicorn backend.app.main:app --host 0.0.0.0 --port ${PORT:-10000}"]
