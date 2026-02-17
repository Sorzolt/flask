FROM ubuntu:16.04

LABEL maintainer="Ryan Shakiba <rshakiba26@cmc.edu>"

RUN apt-get update -y && \
    apt-get install -y python3 python3-pip python3-dev && \
    pip3 install --upgrade "pip<21" "setuptools<45" "wheel<0.35"

WORKDIR /app

COPY requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 5000
CMD ["python3", "app.py"]
