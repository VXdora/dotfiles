FROM almalinux:latest

WORKDIR /app

COPY dotfiles .

RUN chmod 755 setup.sh
