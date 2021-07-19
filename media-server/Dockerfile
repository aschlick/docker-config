FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt update && apt install -y --no-install-recommends pulseaudio pulseaudio-utils g++ pkg-config scons ragel gengetopt libuv1-dev libunwind-dev libpulse-dev libsox-dev libcpputest-dev libtool intltool autoconf automake make cmake git dbus libnss-mdns && apt autoclean -y && apt autoremove -y
RUN usermod -a -G pulse,pulse-access root
WORKDIR /src

# setup dbus
RUN dbus-uuidgen > /var/lib/dbus/machine-id
RUN mkdir /var/run/dbus

# install ROC
RUN git clone https://github.com/roc-project/roc.git
WORKDIR roc
RUN scons -Q --enable-pulseaudio-modules --build-3rdparty=openfec,pulseaudio
RUN scons -Q --enable-pulseaudio-modules --build-3rdparty=openfec,pulseaudio install

EXPOSE 10000
EXPOSE 10001

WORKDIR ../

# install librespot (spotify)
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
RUN git clone https://github.com/librespot-org/librespot
WORKDIR librespot
RUN $HOME/.cargo/bin/cargo build --release --no-default-features --features pulseaudio-backend

WORKDIR ../

ENTRYPOINT ["/bin/tini", "--"]
COPY ./supervisord.conf /etc/supervisor/supervisord.conf
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf", "-n"]
