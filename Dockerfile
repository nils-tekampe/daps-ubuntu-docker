FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get -y install \
        software-properties-common && \
    add-apt-repository ppa:duplicity-team/ppa

RUN apt-get update && apt-get -y install nano sudo git 

	
RUN apt-get clean && \
    rm -fr /var/lib/apt/lists/* \
        /tmp/* \
	/var/tmp/*
	
RUN echo "deb http://de.archive.ubuntu.com/ubuntu/ xenial universe" >>/etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu/ xenial multiverse" >> /etc/apt/sources.list
RUN echo "deb http://de.archive.ubuntu.com/ubuntu/ xenial-backports main restricted universe multiverse" >> /etc/apt/sources.list



RUN apt-get update
RUN apt-get upgrade -y

# Install all mandatory and optional packages from https://github.com/openSUSE/daps/blob/master/INSTALL.adoc


RUN apt-get update && apt-get -y install 	docbook \
											autotools-dev \
											docbook \
											docbook-xml \
											docbook-xsl \
											imagemagick \
											ghostscript \
											inkscape \
											libxml2-utils \
											libxml-commons-external-java \
											libxmlgraphics-commons-java \
											make \
											poppler-utils \
											python-libxml2 \
											python-lxml \
											sgml-base \
											sgml-data \
											w3m \
											fop \
											python-libxml2 \
											xsltproc \
											zip \
											docbook5-xml  \
											docbook-xsl-ns \
											jing \
											aspell \
											epubcheck \
											libimage-exiftool-perl \
											optipng \
											checkbot \
											remake \
											libsaxon-java \
											xmlformat-perl \
											xfig


WORKDIR /home
RUN git clone https://github.com/openSUSE/daps.git -b master --single-branch
WORKDIR /home/daps
RUN ./configure --sysconfdir=/etc
RUN make
RUN su root -c make install 


CMD ["/bin/bash"]
