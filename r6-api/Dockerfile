FROM php:apache

RUN apt-get update
RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app
ADD run.sh .
RUN chmod +x run.sh

CMD ["./run.sh"]