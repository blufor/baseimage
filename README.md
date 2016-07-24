# blufor's Docker baseimage

This Docker image is based on [Phusion's Ubuntu Baseimage](https://github.com/phusion/baseimage-docker).

## Features / Modifications
- Even better syslog logging with all logs ending-up in named pipe
- Removed SSH daemon (the hard way)
- Disabled Cron daemon
- Ruby 2.3
- Useful CLI tools (```unzip```, ```make```, ```git```)
- ETCD toolset (```etcdctl```, ```etcd2yaml```, ```yaml2etcd```, ```etcd-erb```)
- ```port-authority``` gem

There are additional scripts to ease building subsequent images:
- ```b```, ```bl```: print pretty banner
- ```cleanup```: clear temporary locations, caches and logs - useful at the end of build
- ```svc_dir```: creates named service dir for RunIt
