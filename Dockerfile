FROM docker.io/zmkfirmware/zmk-build-arm:stable
WORKDIR /workdir

COPY config/west.yml config/west.yml

RUN ls
# West Init
RUN west init -l config
# West Update
RUN west update
# West Zephyr export
RUN west zephyr-export

COPY build.sh build.sh
CMD ["./build.sh"]
