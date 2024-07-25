FROM ubuntu:18.04

RUN apt-get -y update && apt-get install -y --no-install-recommends \
        wget \
        python3 \
        nginx \
        ca-certificates \
        build-essential \
        git \
        curl \
        python3-pip

RUN python3 -m pip install flask gunicorn setuptools

ENV PYTHONUNBUFFERED=TRUE
ENV PYTHONDONTWRITEBYTECODE=TRUE
ENV PATH="/opt/program:${PATH}"
ENV a=value

# Set up the program in the image
COPY custom_code /opt/program

RUN chmod 755 /opt/program
WORKDIR /opt/program
RUN chmod 755 serve
