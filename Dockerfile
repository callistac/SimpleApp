FROM ubuntu:20.10

# installing python and git
RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install -y git

RUN git clone https://github.com/callistac/SimpleApp.git
WORKDIR /RegistrationService

# install dependencies
RUN pip3 install -r requirements.txt

EXPOSE 5000

RUN ls

# configuring app
ENV FLASK_APP=main.py
CMD ["flask", "run"]
