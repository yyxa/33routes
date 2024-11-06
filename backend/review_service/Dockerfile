FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

COPY Cargo.toml Cargo.lock .env ./

COPY src src

RUN rustup target add x86_64-unknown-linux-musl && \
    cargo build --release --target x86_64-unknown-linux-musl

FROM alpine:3.20.3

RUN apk add --no-cache libstdc++

COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/review_service /usr/local/bin/review_service

COPY .env /usr/local/bin/

WORKDIR /usr/local/bin/

CMD ["./review_service"]
