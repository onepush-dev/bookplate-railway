# Bookplate on Railway

Self-hosted reading tracker ([LeoPhh/bookplate](https://github.com/LeoPhh/bookplate), Apache-2.0) packaged for Railway: app + Postgres, uploads on a volume.
"Bookplate" is the upstream name; this is an unofficial packaging of the unmodified official image.

Deploy button: added after the template is created.

- Owner account is created on first boot: sign in as `admin@example.com` with the generated `BOOKPLATE_OWNER_PASSWORD` (Variables tab). Registration is closed.
- Uploads live on the `/data/uploads` volume; the database is the template's Postgres service.
