FROM ubuntu:20.10

# installing python and git
RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install -y git

RUN git clone https://github.com/callistac/SimpleApp.git
WORKDIR /SimpleApp

# install dependencies
RUN pip3 install -r requirements.txt

# informs Docker that the container listens on port 5000 at runtime
EXPOSE 5000

# configuring app
ENV FLASK_APP=main.py
# Run Flask app
# Note that we need to make the application externally visible (i.e. from outside the container) by specifying --host=0.0.0.0.
CMD ["flask", "run", "--host=0.0.0.0"]
