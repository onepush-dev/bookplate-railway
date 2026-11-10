# Bookplate on Railway: the official image (LeoPhh/bookplate 4.4.3, Apache-2.0), unmodified,
# plus a start script that hands Railway's root-owned uploads volume to the app user and
# creates the owner account on first boot (so there is no open first-visitor sign-up).
# "Bookplate" is the upstream project's name; this is a packaging of it, not an official release.
FROM ghcr.io/leophh/bookplate:4.4.3@sha256:85849b88ee3d15ec6ad03ac9f5b1c3e3d259f1c66c958742eda666fedf0b9518
USER root
RUN apk add --no-cache su-exec
COPY railway/start.sh /usr/local/bin/railway-start
COPY railway/bootstrap.mjs /app/railway-bootstrap.mjs
RUN chmod 755 /usr/local/bin/railway-start
ENV PORT=8080 HOSTNAME=0.0.0.0 REGISTRATION=closed STORAGE=local OWNER_EMAIL=admin@example.com
EXPOSE 8080
CMD ["/usr/local/bin/railway-start"]
