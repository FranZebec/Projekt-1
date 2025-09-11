FROM ubuntu:20.04

WORKDIR /app

COPY . .

RUN apt-get update && apt-get install -y rsync ssh cron

CMD ["bash"]

