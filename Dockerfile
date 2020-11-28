FROM python:3

RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      ffmpeg \
      libgirepository1.0-dev \
      pulseaudio-utils \
  && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/

RUN apt-get update

  # DEBIAN_FRONTEND=noninteractive \
  #   apt-get install -y \

COPY requirements.txt /usr/src/mkchromecast/
WORKDIR /usr/src/mkchromecast/
RUN pip install --no-cache -r requirements.txt
