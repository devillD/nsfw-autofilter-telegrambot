FROM ubuntu:20.04

RUN mkdir /BOT
RUN chmod 777 /BOT
WORKDIR /BOT

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dhaka
RUN apt -qq update && \
    apt -qq install -y wget python3 python3-pip libglib2.0-0 \
                       libglib2.0-dev libsm6 libxext6 libxrender-dev && \
    mkdir models && \
    wget https://github.com/bedapudi6788/NudeNet/releases/download/v0/classifier_model -O models/classifier_model && \
    wget https://raw.githubusercontent.com/shahriarshm/nsfw-autofilter-telegrambot/master/requirements.txt && \
    pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash","start.sh"]
