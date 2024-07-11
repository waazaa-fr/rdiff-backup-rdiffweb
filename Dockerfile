FROM registre.waazaa.fr/alpine-base:3.20.0

LABEL Maintainer="waazaa <waazaa@waazaa.fr>" \
      Description="rdiff-backup"

ENV APP_NAME="rdiff-backup"
ENV TZ=Europe/Paris
ENV CRON_PATTERN="0 */4 * * *"

ENV BRAND_HEADER_NAME="rdiff-backup-rdiffweb"

ENV EMAIL_HOST="xxxxx"
ENV EMAIL_ENCRYPTION="starttls"
ENV EMAIL_SENDER="xxxxx"
ENV EMAIL_USERNAME="xxxxx"
ENV EMAIL_PASSWORD="xxxxx"


# Installation des paquets de base et de travail
RUN apk add --no-cache rdiff-backup build-base python3-dev musl-dev linux-headers
RUN pip install rdiffweb
RUN apk del build-base python3-dev musl-dev linux-headers

COPY /root /
RUN chmod a+x /rdiff/scripts/*.sh

VOLUME /source
VOLUME /backups
VOLUME /restores
WORKDIR /app

EXPOSE 8080

CMD ["/rdiff/scripts/start.sh"]