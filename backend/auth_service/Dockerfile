FROM golang:1.22-alpine

WORKDIR /usr/src/app

RUN apk add --no-cache git

COPY . .

RUN go mod tidy
RUN go mod download

RUN go build -o /usr/local/bin/auth_service ./src

CMD ["auth_service"]