---
title: Security
date: 2020-03-17
weight: 7
---

## Encode

```sh
# hash
printf 'hello' | sha1sum
sha1sum README.md
# encrypt
openssl aes-256-cbc -salt -in README.md -out README.enc.md
openssl aes-256-cbc -d -in README.enc.md -out README.md
```

## User

```sh
whoami
cat /etc/passwd
```