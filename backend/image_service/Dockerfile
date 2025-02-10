FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

COPY Cargo.toml Cargo.lock ./

COPY src src

RUN cargo build --release

FROM rust:1.82.0

COPY --from=builder /usr/src/app/target/release/image_service /usr/local/bin/image_service

CMD ["image_service"]
