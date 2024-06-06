FROM golang:1.22
WORKDIR /data
RUN git clone https://github.com/rom-vtn/trainmap-api
RUN git clone https://github.com/rom-vtn/trainmap-site
RUN git clone https://github.com/rom-vtn/trainmap-loader

WORKDIR /data/trainmap-api
RUN go get github.com/rom-vtn/trainmap-db
RUN go mod download
RUN GOOS=linux go build -o /exec/api

WORKDIR /data/trainmap-loader
RUN go mod download
RUN GOOS=linux go build -o /exec/loader

RUN apt update && apt install -y cron
COPY Crontab /etc/cron.d/

COPY loadandrun.sh /exec/loadandrun.sh

WORKDIR /config
COPY api_config.json ./
COPY loader_config.json ./

EXPOSE 80

CMD cron && /exec/loadandrun.sh
