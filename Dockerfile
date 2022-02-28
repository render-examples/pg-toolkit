FROM golang as build

WORKDIR /app
COPY main.go .
RUN go build -o app main.go

# The postgres version should match the version of the database you are upgrading to
FROM postgres:14

COPY --from=build app .

RUN apt-get update && \
    apt-get install -y --no-install-recommends vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["./app"]
