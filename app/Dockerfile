FROM node:18-slim

RUN addgroup appgroup
RUN adduser --no-create-home --disabled-login --ingroup appgroup appuser

WORKDIR /.aptible
COPY --chown=appuser:appgroup Procfile .

WORKDIR /app
COPY --chown=appuser:appgroup package.json package-lock.json /app/

RUN npm install -only=production  

COPY --chown=appuser:appgroup index.js /app/

USER appuser
EXPOSE 3000