FROM rust:1.82.0 AS builder

WORKDIR /usr/src/app

RUN rustup target add x86_64-unknown-linux-musl

COPY Cargo.toml Cargo.lock ./

COPY src src

RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch

COPY --from=builder /usr/src/app/target/x86_64-unknown-linux-musl/release/user_service /usr/local/bin/user_service

CMD ["user_service"]
