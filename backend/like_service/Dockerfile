FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

FROM rust:1.82.0

COPY --from=builder /usr/src/app/target/release/like_service /usr/local/bin/like_service

CMD ["like_service"]
