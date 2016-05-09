# OpenCanary Docker image

## About
> OpenCanary is a daemon that runs canary services, which trigger alerts when (ab)used. The alerts can be sent to a variety of sources, including syslog, emails and a companion daemon opencanary-correlator.

> The Correlator coalesces multiple related events (eg. individual brute-force login attempts) into a single alert sent via email or SMS.

[Documentation](http://opencanary.readthedocs.io/en/latest/)

[Official Docker Hub](https://hub.docker.com/r/dustyfresh/opencanary/)

OpenCanary is pretty awesome and can be deployed in a bunch of different ways. I figured that combining the power of OpenCanary and it's modules with cool Docker networking functions would be interesting. The default configuration for this image is running just a few services with a basic PyLogger setup.

## Building the image
```
$ git clone https://github.com/dustyfresh/opencanary.git && cd opencanary && docker build --rm -t opencanary .

$ docker run -d -p 80:80 -p 3306:3306 -p 21:21 --name opencanary opencanary

$ docker exec -it opencanary bash -c 'cat /var/log/opencanary.log'
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:30.363604", "logdata": {"msg": {"logdata": "Added service from class CanaryHTTP in opencanary.modules.http to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:30.365347", "logdata": {"msg": {"logdata": "Added service from class CanaryFTP in opencanary.modules.ftp to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.379704", "logdata": {"msg": {"logdata": "Added service from class CanarySSH in opencanary.modules.ssh to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.380576", "logdata": {"msg": {"logdata": "Added service from class CanaryMySQL in opencanary.modules.mysql to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.381087", "logdata": {"msg": "Canary running!!!"}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
```

## Logs
As you can see from the above docker run command we are storing logs in **/var/log/opencanary.log**. You may find it necessary to create a separate volume structure for your log data.

## Setting up your services
You can modify the opencanary.conf file within the conf/ directory to specify which services you would like to advertise. You can see the code for OpenCanary's modules [here](https://github.com/thinkst/opencanary/tree/master/opencanary/modules)

## Additional documentation
Read OpenCanary documentaton [here](http://opencanary.readthedocs.io/en/latest/)

## More
* [Bring Back the Honeypots](https://www.youtube.com/watch?v=W7U2u-qLAB8)
* [OpenCanary: a new Python-based honeypot](https://www.youtube.com/watch?v=lXhypJUbxVM)
