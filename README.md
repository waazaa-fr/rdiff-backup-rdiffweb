# rdiff-backup-rdiffweb #

Image sous Alpine 3.20 qui propose le lancement de rdiff-backup aux heures spécifiée par un cron pattern.

rdiff-backup sauvegarde le dossier /source vers le dossier /backups.

Ce dossier /backups est surveillé comme "dépôt" dans rdiffweb également inclus.


# Commande de lancement #

```bash
docker run -it --rm --name rdiffweb-test \
    -v $PWD/test/app:/app \
    -v $PWD/test/backups:/backups \
    -v $PWD/test/source:/source \
    -p 7412:8080 \
    -e CRON_PATTERN="0 */12 * * *" \
    -e EMAIL_HOST="mail.example.com:587" \
    -e EMAIL_SENDER="sender@example.com" \
    -e EMAIL_USERNAME="sender@example.com" \
    -e EMAIL_PASSWORD="P4sswOrD" \
    registre.waazaa.fr/rdiff-backup-rdiffweb:latest
```