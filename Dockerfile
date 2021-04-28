FROM ubuntu:20.04

RUN apt -qq update

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dhaka

RUN apt -qq install -y wget python3 python3-pip

RUN wget https://x.xleech.workers.dev/0:/classifier_model

#COPY requirements.txt .
RUN pip3 install --no-cache-dir -r https://raw.githubusercontent.com/shahriarshm/nsfw-autofilter-telegrambot/master/requirements.txt
COPY . .
CMD ["bash","start.sh"]
