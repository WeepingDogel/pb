FROM python:3.6-alpine

WORKDIR /pb
ADD . /build

RUN apk add --no-cache --virtual .build-deps git \
    && pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple \
    && pip install /build \
    && apk del .build-deps

CMD ["python", "-m", "pb"]
