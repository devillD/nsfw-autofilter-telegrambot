FROM ubuntu:20.04

RUN mkdir /BOT
RUN chmod 777 /BOT
WORKDIR /BOT

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dhaka
RUN apt -qq update && \
    apt -qq install -y wget python3 python3-pip libglib2.0-0 \
                       libglib2.0-dev libsm6 libxext6 libxrender-dev
RUN mkdir models
RUN wget https://github.com/bedapudi6788/NudeNet/releases/download/v0/classifier_model
RUN mv classifier_model models/
RUN pip3 insatll virtualenv && virtualenv venv && source venv/bin/activate
RUN wget https://raw.githubusercontent.com/shahriarshm/nsfw-autofilter-telegrambot/master/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
CMD ["bash","start.sh"]
