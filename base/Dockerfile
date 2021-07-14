FROM debian:buster-slim
MAINTAINER Hieutv26 <hieutv26@viettel.com.vn>

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

# Install some deps, lessc and less-plugin-clean-css, and wkhtmltopdf
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        python3 \
        python3-pip \
        build-essential \
		libssl-dev \
        wget \
        python3-dev \
        python3-venv \
        python3-wheel \
        libxslt-dev \
        libzip-dev \
        libldap2-dev \
        libsasl2-dev \
        python3-setuptools \
        node-less \
        libjpeg-dev \
        gdebi \
        libpq-dev \
        python-dev \
        libxml2-dev \
        libxslt1-dev \
        libldap2-dev \
        libsasl2-dev \
        libffi-dev \
        curl \
        gnupg2 \
    && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb \
    && echo 'ea8277df4297afc507c61122f3c349af142f31e5 wkhtmltox.deb' | sha1sum -c - \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ./wkhtmltox.deb \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb 

# install node js, rtlcss
RUN apt-get update && apt-get install nodejs npm -y
RUN npm install -g rtlcss

# install lib base
COPY ./requirements_prod.txt /
RUN pip3 install -r /requirements_prod.txt

# install latest postgresql-client
COPY ./postgres.sh /
RUN set -x; \
        sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
        && /postgres.sh
