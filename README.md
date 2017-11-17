# Docker Wren:DS

#### This docker container provides [Wren:DS](https://github.com/WrenSecurity/wrends) server running on CentOS 7.
To *quickstart* the container execute:

```
mkdir -p /opt/docker/wrends
docker run -d \
	-p 1389:1389 -p 1636:1636 -p 4444:4444 \
	-v /opt/docker/wrends:/opt/wrends \
	-v /etc/localtime:/etc/localtime:ro \ 
	 ajeeth/wrends:latest
```

Once the container is running, launch the control-panel (`/opt/docker/wrends/bin/control-panel`) and connect to Wren:DS on port 4444. 

Default *base DN* is `dc=example,dc=com`, *root DN* is `cn=Directory Manager` and *root password* is `changemefirst`.

These  values can be changed by passing your setting with the following environment variables:
- `LDAP_BASE_DN`
- `LDAP_ROOT_DN`
- `LDAP_ROOT_PASS`

Example with different _base DN_ and _root password_:
```
docker run -d \ 
	-p 1389:1389 -p 1636:1636 -p 4444:4444 \ 
	-v /opt/docker/wrends:/opt/wrends \ 
	-v /etc/localtime:/etc/localtime:ro \ 
	-e LDAP_BASE_DN='dc=mydomain.org' \ 
	-e LDAP_ROOT_PASS='justapass' \
	 ajeeth/wrends:latest
```

---

docker hub url: https://hub.docker.com/r/ajeeth/wrends

github url: https://github.com/ajeeth/docker_wrends
