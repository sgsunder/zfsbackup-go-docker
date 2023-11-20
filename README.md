Docker container that wraps https://github.com/someone1/zfsbackup-go

Run in the following manner:
```
docker run -d \
  --name zfsbackup \
  --privileged \
  --device /dev/zfs:/dev/zfs \
  -e PGP_PASSPHRASE="foo" \
  -e PGP_PUBLIC_KEY="/backblaze.gpg.asc" \
  -e PGP_SECRET_KEY="/backblaze.secret.gpg.asc" \
  -e PGP_EMAIL="alice@example.com" \
  -e B2_ACCOUNT_ID="bar" \
  -e B2_ACCOUNT_KEY="baz" \
  -v "/var/log/zfsbackup:/var/log/zfsbackup" \
  -v "./backblaze.gpg.asc:/backblaze.gpg.asc" \
  -v "./backblaze.secret.gpg.asc:/backblaze.secret.gpg.asc" \
  ghcr.io/sgsunder/zfsbackup-go:latest \
  send tank/foobar@snapshot "b2://target-bucket-name"
```
