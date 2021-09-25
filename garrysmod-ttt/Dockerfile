FROM hackebein/steamcmd

MAINTAINER rvbg@pm.me

RUN mkdir /cfg
VOLUME /cfg
RUN mkdir /app
VOLUME /app
RUN mkdir /content
VOLUME /content
WORKDIR /

ADD run.sh /
RUN chmod +x run.sh

RUN apt-get update && apt-get install screen tree lib32tinfo5 libcurl3-gnutls:i386 -y && apt-get clean
RUN steamcmd \ +quit
RUN mkdir -p /root/.steam/sdk32
RUN ln -sf /root/.steam/steamcmd/linux32/* /root/.steam/sdk32

ENV PORT="27015"
ENV MAXPLAYERS="16"
ENV STARTMAP="gm_construct"
ENV WORKSHOP="0"
ENV NAME="rvbg/garrysmod-ttt"
ENV PASSWORD=""
ENV MAIL="no@mail.addit"
ENV FPT="60"
ENV PT="15"
ENV DT="15"
ENV HASTE="0"
ENV RT="5"
ENV ROUNDS="5"
ENV MINPLAYERS="2"
ENV TRAITORPCT="0.29"
ENV TRAITORMAX="3"
ENV DETPCT="0.24"
ENV DETMAX="2"
ENV DETMIN=5"

CMD ["./run.sh"]
