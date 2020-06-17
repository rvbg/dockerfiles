FROM ubuntu:latest

MAINTAINER rvbg@pm.me

RUN apt-get update
RUN apt-get install -y git npm pkg-config build-essential curl

RUN mkdir /fibridge
WORKDIR /fibridge
RUN git clone https://github.com/anderspitman/fibridge-proxy-rs
RUN git clone https://github.com/anderspitman/fibridge-gui-js

WORKDIR /fibridge/fibridge-gui-js
RUN npm install
RUN npm run build

WORKDIR /fibridge/fibridge-proxy-rs
RUN curl https://sh.rustup.rs -sSf | bash -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"
RUN cargo build --release


FROM ubuntu:latest

RUN mkdir /app
WORKDIR /app
COPY --from=0 /fibridge/fibridge-proxy-rs/target/release/fibridge-proxy-rs fibridge-rs
ADD run.sh .
RUN chmod +x run.sh

CMD ["./run.sh"]