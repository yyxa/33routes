FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

FROM rust:1.82.0

COPY --from=builder /usr/src/app/target/release/user_service /usr/local/bin/user_service

CMD ["user_service"]
