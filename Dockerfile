FROM python:3

RUN \
  apt update && \
  DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
      ffmpeg \
      pulseaudio-utils \
  && \
  apt clean && \
  rm -rf /var/lib/apt/lists/

COPY requirements.txt /usr/src/mkchromecast/
WORKDIR /usr/src/mkchromecast/
RUN pip install --no-cache -r requirements.txt
