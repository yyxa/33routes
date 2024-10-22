# Стартовый образ Rust
FROM rust:1.81 AS builder

WORKDIR /usr/src/app

COPY Cargo.toml Cargo.lock .env ./

COPY src src

RUN cargo build --release

FROM rust:alpine3.20

COPY --from=builder /usr/src/app/target/release/user_service /usr/local/bin/user_service

EXPOSE 8001

CMD ["user_service"]
