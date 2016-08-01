FROM alpine:3.4

ADD repositories /etc/apk/repositories
RUN apk update
RUN apk add python python-dev py-pip git gfortran build-base py-numpy@testing py-scipy@testing py-numpy-dev@testing py-scipy-dev@testing
RUN pip install janome
RUN pip install git+https://github.com/shinichinomura/summpy

RUN adduser -D summpy
USER summpy

CMD python -m summpy.server -h 0.0.0.0 -p $PORT

