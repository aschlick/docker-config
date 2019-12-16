FROM dorowu/ubuntu-desktop-lxde-vnc

RUN apt update && apt install -y --no-install-recommends pulseaudio pulseaudio-utils g++ pkg-config scons ragel gengetopt libuv1-dev libunwind-dev libpulse-dev libsox-dev libcpputest-dev
RUN apt install -y --no-install-recommends libtool intltool autoconf automake make cmake git
RUN apt autoclean -y 
RUN apt autoremove -y
RUN git clone https://github.com/roc-project/roc.git

WORKDIR roc

RUN scons -Q --enable-pulseaudio-modules --build-3rdparty=openfec,pulseaudio
RUN scons -Q --enable-pulseaudio-modules --build-3rdparty=openfec,pulseaudio install

WORKDIR ../

ENTRYPOINT ["/bin/tini", "--"]
CMD ["pulseaudio", "-D", "--system"]
