Docker container that wraps https://github.com/someone1/zfsbackup-go

Run in the following manner:
```
docker run -d \
  --name zfsbackup \
  --device /dev/zfs:/dev/zfs \
  -e PGP_PASSPHRASE="foo" \
  -e B2_ACCOUNT_ID="bar" \
  -e B2_ACCOUNT_KEY="baz" \
  -v "./backblaze.gpg.asc:/backblaze.gpg.asc" \
  -v "./backblaze.secret.gpg.asc:/backblaze.secret.gpg.asc" \
  send --jsonOutput \
  --publicKeyRingPath /backblaze.gpg.asc \
  --secretKeyRingPath /backblaze.secret.gpg.asc \
  --signFrom "example@example.com" \
  --encryptTo "example@example.com" \
  tank/foobar@snapshot "b2://target-bucket-name"
```