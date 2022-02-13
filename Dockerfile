FROM python:3-bullseye

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /opt/jabledownload

RUN apt update && \
    apt dist-upgrade -y && \
    apt install -y ffmpeg \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*

COPY . /opt/jabledownload

RUN pip3 install -r requirements.txt

WORKDIR /data

ENTRYPOINT ["python", "/opt/jabledownload/main.py"]
CMD ["-h"]    
