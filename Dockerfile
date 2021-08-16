FROM ubuntu:20.04

RUN mkdir /BOT
RUN chmod 777 /BOT
WORKDIR /BOT

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dhaka
RUN apt -qq update
RUN apt -qq install -y wget python3 python3-pip libglib2.0-0 \
                       libglib2.0-dev libsm6 libxext6 libxrender-dev
RUN mkdir model && chmod 777 model
RUN wget https://github.com/bedapudi6788/NudeNet/releases/download/v0/classifier_model -O model/classifier_model.h5
RUN wget https://raw.githubusercontent.com/shahriarshm/nsfw-autofilter-telegrambot/master/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash","start.sh"]
