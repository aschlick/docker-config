FROM debian:jessie

RUN apt-get update -qq
RUN apt-get install -yqq apt-utils libasound2-dev pulseaudio \
  libpulse-dev git curl build-essential pkg-config
RUN curl https://sh.rustup.rs -sSf > rust.sh
RUN sh /rust.sh -y

RUN git clone https://github.com/Spotifyd/spotifyd.git
WORKDIR /spotifyd
RUN ~/.cargo/bin/cargo build --release --no-default-features --features pulseaudio_backend

ADD spotifyd.conf /etc/spotifyd/spotifyd.conf


ENTRYPOINT ["/spotifyd/target/release/spotifyd", "-c", "/etc/spotifyd/spotifyd.conf", "--no-daemon", "-v"]
