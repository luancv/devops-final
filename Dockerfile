FROM python:3.7.3-stretch

RUN apt-get clean \
    && apt-get -y update

RUN apt-get -y install \
    nginx \
    python3-dev \
    build-essential
    
WORKDIR /app

COPY . app.py /app/

# hadolint ignore=DL3013
RUN pip install --no-cache-dir --upgrade pip &&\
    pip install --no-cache-dir --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]
