# rdiff-backup-rdiffweb #

**English**


Image under Alpine 3.20 that offers the launch of rdiff-backup at times specified by a cron pattern.

rdiff-backup backs up the /source folder to the /backups folder.

This /backups folder is monitored as a "repository" in rdiffweb, which is also included.



**Francais**


Image sous Alpine 3.20 qui propose le lancement de rdiff-backup aux heures spécifiées par un cron pattern.

rdiff-backup sauvegarde le dossier /source vers le dossier /backups.

Ce dossier /backups est surveillé comme "dépôt" dans rdiffweb également inclus.




# Docker run #

```bash
docker run -it --rm --name rdiffweb-test \
    -v /path/to/app:/app \
    -v /path/to/backups:/backups \
    -v /path/to/source:/source \
    -p 8080:8080 \
    -e CRON_PATTERN="0 */12 * * *" \
    -e EMAIL_HOST="mail.example.com:587" \
    -e EMAIL_SENDER="sender@example.com" \
    -e EMAIL_USERNAME="sender@example.com" \
    -e EMAIL_PASSWORD="P4sswOrD" \
    waazaafr/rdiff-backup-rdiffweb:latest
```



# Docker compose #

```yaml
services:
  rdiff-backup-rdiffweb:
    image: waazaafr/rdiff-backup-rdiffweb:latest
    container_name: rdiff-backup-rdiffweb
    environment:
      - TZ=Europe/Paris
      - CRON_PATTERN=0 */12 * * *
      - EMAIL_HOST=mail.example.com:587
      - EMAIL_SENDER=sender@example.com
      - EMAIL_USERNAME=sender@example.com
      - EMAIL_PASSWORD=P4sswOrD
    volumes:
      - /path/to/app:/app
      - /path/to/backups:/backups
      - /path/to/source:/source
    ports:
      - 8080:8080
    restart: unless-stopped
```


Feel free to join me on my discord server: https://discord.gg/p9xkjEw8ts

If you like this, consider buing me a coffee: https://buymeacoffee.com/waazaa

If you need an UnRAID license follow this link: https://unraid.net/pricing?via=4c3f80
