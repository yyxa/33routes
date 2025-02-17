FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

COPY . .

RUN cargo build --release

FROM rust:1.82.0

COPY --from=builder /usr/src/app/target/release/collection_service /usr/local/bin/collection_service

CMD ["collection_service"]
