FROM kuyoonjo/choco

SHELL ["cmd", "/S", "/C"]

ENV ELECTRON_MIRROR http://npm.taobao.org/mirrors/atom-shell
RUN cmake-js || true
RUN cmake-js --runtime=electron --runtime-version=5.0.10 || true