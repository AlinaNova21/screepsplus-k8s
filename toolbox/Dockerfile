FROM screepers/screeps-launcher AS screeps-launcher

FROM ubuntu:18.04
RUN apt-get update && apt-get install -y build-essential htop tmux screen nano mongodb-clients redis less curl wget httpie rsync openssh-client
COPY --from=screeps-launcher /usr/bin/screeps-launcher /usr/bin/
RUN groupadd --gid 1000 screeps \
  && useradd --uid 1000 --gid screeps --shell /bin/bash --create-home screeps \
  && mkdir /screeps && chown screeps.screeps /screeps
USER screeps
WORKDIR /home/screeps
RUN echo "alias mongo='mongo --host=mongodb'" >> .bashrc
ENTRYPOINT [ "/bin/bash" ]
