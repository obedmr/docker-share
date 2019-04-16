docker-share
============
[![](https://images.microbadger.com/badges/image/obedmr/share.svg)](http://microbadger.com/images/obedmr/share "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/obedmr/share.svg)](http://microbadger.com/images/obedmr/share "Get your own version badge on microbadger.com")

Simple HTTP File Share Server

Build
-----
```
docker build -t obedmr/share .
```

Or just pull it from Dockerhub
---------------------------
```
docker pull obedmr/share
```

Start your Simple HTTP Share Server
-----------------------------------
```
docker run -d --name share-server -p 8080:80 -v `pwd`:/share obedmr/share
```



That's it, now ...
------------------

**Go to:** [http://localhost:8080](http://localhost:8080)