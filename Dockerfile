FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive


RUN apt update && apt upgrade -y
RUN apt install htop git curl sudo openssh-server -y

RUN useradd -rm -d /home/ubuntu -s /bin/bash -g root -G sudo -u 1000 sabarish
RUN  echo 'sabarish:password' | chpasswd

RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash -
RUN sudo apt install nodejs -y
RUN bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
RUN apt install -y locales locales-all
RUN locale-gen --purge en_US.UTF-8
RUN service ssh start

EXPOSE 80 22

CMD ["/usr/sbin/sshd","-D"]


