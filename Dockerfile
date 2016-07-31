FROM alpine:3.4

ADD repositories /etc/apk/repositories
RUN apk update
RUN apk add python python-dev py-pip git gfortran build-base py-numpy@testing py-scipy@testing py-numpy-dev@testing py-scipy-dev@testing
RUN pip install janome
RUN pip install git+https://github.com/shinichinomura/summpy

EXPOSE 8080
CMD ["python", "-m", "summpy.server", "-h", "0.0.0.0", "-p", "8080"]

