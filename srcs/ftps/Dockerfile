FROM alpine

RUN apk add vsftpd \
	openrc &&\
	rc-update add vsftpd default 

EXPOSE 21
