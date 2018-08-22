# Download base image ubuntu 18.04
FROM ubuntu:18.04

# Most important of all give this your own name
MAINTAINER adityakarnik

RUN apt-get update \
	&& apt-get install -my wget gnupg \
	&& apt-get install -y --no-install-recommends \
		apt-utils \
		ca-certificates \
		apt-transport-https \
		jq \
		numactl \
&& rm -rf /var/lib/apt/lists/*

RUN apt-get update

# Installing python and its dependencies
RUN apt-get install -y python-pip python-dev build-essential

# Copy the local folder of you app to docker container
COPY app/ /app

# Navigate to you app directory
WORKDIR /app

# Install you application dependencies
RUN pip install -r requirements.txt

# This will the command run when you start your container
ENTRYPOINT ["python"]

# Like "python app.py", this will run when you start it
CMD ["app.py"]
