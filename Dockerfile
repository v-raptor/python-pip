FROM alpine

ADD requirements.txt /code/
WORKDIR /code

RUN apk add --no-cache ca-certificates python3 build-base python3-dev \
    && python3 -m ensurepip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install --upgrade pip setuptools \
    && pip3 install --no-cache-dir -r requirements.txt \
    && rm -r /root/.cache \
    && apk del build-base python3-dev

CMD [ "python3", "app.py" ]
