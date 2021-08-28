FROM debian:buster-slim
MAINTAINER Hieutv26 <hieutv26@viettel.com.vn>

SHELL ["/bin/bash", "-xo", "pipefail", "-c"]

# Generate locale C.UTF-8 for postgres and general locale data
ENV LANG C.UTF-8

COPY ./jdk-16.0.1 /odoo/jdk

ENV JAVA_HOME /odoo/jdk

ENV PATH=.:$JAVA_HOME/bin:$JAVA_HOME/jre/bin:$PATH

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
        python3-dev cargo \
        python3-venv \
        python3-wheel \
        libxslt-dev \
        libzip-dev \
        libldap2-dev \
        libsasl2-dev \
        python3-setuptools \
        node-less \
        libjpeg-dev \
		libtiff5-dev \
		libopenjp2-7-dev \
		zlib1g-dev \
		libfreetype6-dev \
		liblcms2-dev \
		libwebp-dev \
		libharfbuzz-dev \
		libfribidi-dev \
        gdebi \
        libpq-dev \
        python-dev \
        libxml2-dev \
        libxslt1-dev \
        libldap2-dev \
        libsasl2-dev \
		libxcb1-dev libpq-dev \
        libffi-dev \
        curl \
        gnupg2 \
        libreoffice \
		libreoffice-writer \
		ure \
		libreoffice-java-common \
		libreoffice-core \
		libreoffice-common \
		fonts-opensymbol \
		hyphen-fr \
		hyphen-de \
		hyphen-en-us \
		hyphen-it \
		hyphen-ru \
		fonts-dejavu \
		fonts-dejavu-core \
		fonts-dejavu-extra \
		fonts-droid-fallback \
		fonts-dustin \
		fonts-f500 \
		fonts-fanwood \
		fonts-freefont-ttf \
		fonts-liberation \
		fonts-lmodern \
		fonts-lyx \
		fonts-sil-gentium \
		fonts-texgyre \
		fonts-tlwg-purisa \
		swig \
		dos2unix \
    && apt-get -y -q remove libreoffice-gnome \
	&& apt -y autoremove \
    && curl -o wkhtmltox.deb -sSL https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb \
    && echo 'ea8277df4297afc507c61122f3c349af142f31e5 wkhtmltox.deb' | sha1sum -c - \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends ./wkhtmltox.deb \
    && rm -rf /var/lib/apt/lists/* wkhtmltox.deb

# install node js, rtlcss
RUN apt-get update && apt-get install nodejs npm -y
RUN npm install -g rtlcss

RUN pip3 install setuptools wheel

# install lib base
COPY ./requirements_prod.txt /
RUN pip3 install -r /requirements_prod.txt

# install latest postgresql-client
RUN set -x; \
        sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list' \
        && set -eo pipefail \
		&& curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
		&& apt-get update \
		&& apt-get install -y --no-install-recommends postgresql-client libpq-dev \
		&& apt-get -y install -f --no-install-recommends
