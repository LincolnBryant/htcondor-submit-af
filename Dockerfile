ARG BASE_IMAGE=lincolnbryant/htcondor-execute-af2:latest
FROM ${BASE_IMAGE}
ARG BASE_IMAGE

LABEL org.opencontainers.image.title="HTCondor ATLAS AF Submit image derived from ${BASE_IMAGE}"

RUN yum install -y openssh-server

RUN yum groupinstall -y X11
RUN yum groupinstall -y xfce

COPY condor/*.conf /etc/condor/config.d/
COPY cron/* /etc/cron.d/
COPY supervisor/* /etc/supervisord.d/
COPY image-config/* /etc/osg/image-config.d/
