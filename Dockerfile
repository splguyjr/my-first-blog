FROM ubuntu:22.04 as builder

RUN apt-get update
RUN apt-get install git -y
RUN git clone https://github.com/splguyjr/my-first-blog


FROM python:3.10-alpine

COPY --from=builder /my-first-blog /app

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install django~=4.0.6

ENV PYTHONUNBUFFERED=1

WORKDIR app

CMD ["python3", "manage.py", "runserver", "--noreload", "0.0.0.0:8080"]