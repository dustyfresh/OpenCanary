# OpenCanary Docker image

## About
> OpenCanary is a daemon that runs canary services, which trigger alerts when (ab)used. The alerts can be sent to a variety of sources, including syslog, emails and a companion daemon opencanary-correlator.

> The Correlator coalesces multiple related events (eg. individual brute-force login attempts) into a single alert sent via email or SMS.

[Documentation](http://opencanary.readthedocs.io/en/latest/)

## Building the image
```
$ git clone https://github.com/dustyfresh/opencanary.git && cd opencanary && docker build --rm -t opencanary .

$ docker run -d -p 80:80 -p 3306:3306 -p 21:21 --name opencanary opencanary

$ $ docker exec -it opencanary bash -c 'cat /var/log/opencanary.log'
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:30.363604", "logdata": {"msg": {"logdata": "Added service from class CanaryHTTP in opencanary.modules.http to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:30.365347", "logdata": {"msg": {"logdata": "Added service from class CanaryFTP in opencanary.modules.ftp to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.379704", "logdata": {"msg": {"logdata": "Added service from class CanarySSH in opencanary.modules.ssh to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.380576", "logdata": {"msg": {"logdata": "Added service from class CanaryMySQL in opencanary.modules.mysql to fake"}}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
{"dst_host": "", "dst_port": -1, "local_time": "2016-05-09 03:17:32.381087", "logdata": {"msg": "Canary running!!!"}, "logtype": 1001, "node_id": "foobar.com", "src_host": "", "src_port": -1}
```

## Logs
As you can see from the above docker run command we are storing logs in the
