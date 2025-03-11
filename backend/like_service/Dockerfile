FROM ubuntu:24.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Europe/Moscow \
    PATH="/root/.local/bin:$PATH"

SHELL ["/bin/bash", "-c"]

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        build-essential \
        pipx && \
    rm -rf /var/lib/apt/lists/* && \
    pipx ensurepath && \
    pipx install cmake && \
    pipx install conan

COPY conanfile.py /service/conanfile.py
COPY cxxprofile /service/cxxprofile

WORKDIR /service/build

RUN conan profile detect && \
    mv /service/cxxprofile ~/.conan2/profiles/cxxprofile && \
    conan install .. --profile=cxxprofile --output-folder=. --build=missing

COPY . /service

RUN source conanbuild.sh && \
    cmake -DCMAKE_BUILD_TYPE=Release .. && \
    cmake --build . && \
    source deactivate_conanbuild.sh

FROM ubuntu:24.04

COPY --from=builder /service/build/like_service /service/like_service

CMD ["/service/like_service", "0.0.0.0", "8100"]