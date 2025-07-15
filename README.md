# chronyd
chrony container image

## How to run

```sh
docker build -t chronyd .

docker run -d \
  --name chronyd \
  --cap-add=NET_BIND_SERVICE \
  -p 123:123/udp \
  chronyd
```
