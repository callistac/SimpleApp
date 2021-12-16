# FROM ubuntu:20.10
FROM python:3.8-slim-buster

# installing python and git
RUN apt-get update 
RUN apt-get install -y git

RUN git clone https://github.com/callistac/SimpleApp.git
WORKDIR /SimpleApp

# install dependencies
RUN pip3 install -r requirements.txt

EXPOSE $PORT
# configuring app
ENV FLASK_APP=main.py
# Run Flask app
# Note that we need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD ["flask", "run", "--host=0.0.0.0"]
