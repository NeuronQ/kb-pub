# network
```sh
ping google.ocm
traceroute google.com
mtr google.com  # needs sudo on mac
# short for "my traceroute"
```

# transport
* netcat:
```sh
nc google.com 80  # then write request :)
nc -z google.com 80  # zero input
nc -v google.com 80  # verbose
nc6 google.com 80  # if you have newer ipv6 supporting version
```

```bash
Test-NetConnection google.com
```

# DNS
```sh
nslookup twitter.com
nslookup  # interactive mode
```

```sh (nslookup propmpt)
> server 8.8.8.8  # all following querie swill use this

> set type=MX  # dns record type (by default it looks A records)

> set debug  # very verbose
```

* public dsn
    - level 3: 4.2.2.1-6
    - google: 8.8.8.8, 8.8.4.4
