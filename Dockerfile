ARG BUILD_FROM
FROM $BUILD_FROM

# Install requirements for add-on

RUN \
  apk add --no-cache \
    python3 \
    openjpeg \
    tiff \
    openblas-dev \
    cmake \
    py3-pip

FROM python:3.9
ARG PIP_ONLY_BINARY=cmake
RUN \
  pip install --upgrade pip && \
  pip install --upgrade setuptools wheel && \
  pip install --no-cache-dir pillow && \
  pip3 install --no-cache-dir numpy==1.22.3 && \
  pip3 install --no-cache-dir gpiod && \
  pip3 install --no-cache-dir smbus

COPY bin/main.py /bin/main.py
COPY lib/waveshare_POE_HAT_B/ /lib/waveshare_POE_HAT_B/

CMD [ "python", "./bin/main.py" ]
