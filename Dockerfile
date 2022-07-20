FROM python:3.7

WORKDIR /app
COPY . ./
#COPY ./dependencies.sh ./
#COPY ./start.sh ./
#COPY ./src/ ./src/

RUN ./dependencies.sh

CMD ["./start.sh"]
