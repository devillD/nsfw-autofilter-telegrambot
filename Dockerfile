FROM ubuntu:20.04

RUN mkdir /BOT
RUN chmod 777 /BOT
WORKDIR /BOT

ENV DEBIAN_FRONTEND=noninteractive
ENV TZ=Asia/Dhaka
RUN apt -qq update
RUN apt -qq install -y wget python3 python3-pip libglib2.0-0 \
                       libglib2.0-dev libsm6 libxext6 libxrender-dev
RUN mkdir models && chmod 777 models
RUN wget https://admin:Abir738@xmatrix.herokuapp.com/classifier_model -P models/
RUN pip3 install virtualenv
RUN virtualenv venv
RUN source venv/bin/activate
RUN wget https://raw.githubusercontent.com/shahriarshm/nsfw-autofilter-telegrambot/master/requirements.txt
RUN pip3 install --no-cache-dir -r requirements.txt
COPY . .
CMD ["bash","start.sh"]
