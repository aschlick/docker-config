FROM debian:jessie

RUN apt-get update -qq
RUN apt-get install -yqq apt-utils libasound2-dev pulseaudio \
  libpulse-dev git curl build-essential sudo pkg-config \
  pulseaudio-module-zeroconf
RUN curl https://sh.rustup.rs -sSf > rust.sh
RUN sudo sh /rust.sh -y

RUN git clone https://github.com/Spotifyd/spotifyd.git
WORKDIR /spotifyd
RUN ~/.cargo/bin/cargo build --release --no-default-features --features pulseaudio_backend

RUN addgroup --system pulse
RUN adduser --system --ingroup pulse --home /var/run/pulse pulse
RUN addgroup --system pulse-access
RUN adduser pulse audio

WORKDIR /
ADD system.pa /etc/pulse/system.pa
ADD spotifyd.conf /etc/spotifyd/spotifyd.conf
ADD startup.sh /startup.sh

run chmod +x /startup.sh

EXPOSE 6767
EXPOSE 4713

ENTRYPOINT "/startup.sh"
# ENTRYPOINT ["/spotifyd/target/release/spotifyd", "-c", "/etc/spotifyd/spotifyd.conf", "--no-daemon"]
