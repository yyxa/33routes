FROM golang:1.22-alpine AS builder

WORKDIR /usr/src/app

RUN apk add --no-cache git

COPY go.mod go.sum ./

RUN go mod download

COPY . .

RUN go build -o /usr/local/bin/auth_service ./src

FROM alpine:latest

COPY --from=builder /usr/local/bin/auth_service /usr/local/bin/auth_service

CMD ["auth_service"]