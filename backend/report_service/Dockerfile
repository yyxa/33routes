# Стартовый образ Rust
FROM rust:1.81 AS builder

WORKDIR /usr/src/app

COPY Cargo.toml Cargo.lock .env ./

COPY src src

RUN cargo build --release

FROM rust:alpine3.20

COPY --from=builder /usr/src/app/target/release/report_service /usr/local/bin/report_service

EXPOSE 8001

CMD ["report_service"]
