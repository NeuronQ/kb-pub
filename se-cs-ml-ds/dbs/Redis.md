FROM: https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-debian-9

## Install

```sh
sudo apt update
sudo apt install redis-server -y
```

```sh
sudo vim /etc/redis/redis.conf
# change `supervised no` to `supervised systemd`
sudo systemctl restart redis
sudo systemctl status redis
# to start maually only:
#sudo systemctl disable redis
```

## Test install

```
redis-cli
```

In redis cli:
```
> ping
PONG
> set answer 42
OK
> get answer
"42"
```

Test persistence after restarting:
```
sudo systemctl restart redis
redis-cli
#> get answer
```

## Basic secure config

- `sudo vim /etc/redis/redis.conf`
- ensure `bind 127.0.0.1` (check it's un-commented!)
- `sudo systemctl restart redis.service`

## Test basic secure config (not tested)

- `sudo netstat -lnp | grep redis`
- to output: `tcp        0      0 127.0.0.1:6379          0.0.0.0:*               LISTEN      8884/redis-server 1`
  - `127.0.0.1:` bit is important, to show that it's binded and listening to local port only

## Set password

- `sudo vim /etc/redis/redis.conf`
- `requirepass your_redis_password`
- `sudo systemctl restart redis.service`

## Test set password

`redis-cli`

```redis-cli
> set key1 10
(error) NOAUTH Authentication required.
> auth your_redis_password
OK
> set key1 10
OK
> get key1
"10"

## More

https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-debian-9
