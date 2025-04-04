FROM polympiads/hc2/live-v3

WORKDIR /tools
RUN git clone https://github.com/icpc/balloons.git

WORKDIR /tools/balloons

COPY ./build-balloons.sh ./build.sh
RUN bash ./build.sh

COPY ./entrypoint.sh /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]