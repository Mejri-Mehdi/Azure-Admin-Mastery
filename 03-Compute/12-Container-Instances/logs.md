# Container Logs – nginx-container

**Collected after restart and a few browser requests.**

## Startup Logs

```text
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: Enabled listen on IPv6 in /etc/nginx/conf.d/default.conf
/docker-entrypoint.sh: Sourcing /docker-entrypoint.d/15-local-resolvers.envsh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up

2026/07/24 15:10:23 [notice] 1#1: using the "epoll" event method
2026/07/24 15:10:23 [notice] 1#1: nginx/1.27.4
2026/07/24 15:10:23 [notice] 1#1: built by gcc 14.2.0 (Debian 14.2.0-19)
2026/07/24 15:10:23 [notice] 1#1: OS: Linux 5.15.0-1083-azure
2026/07/24 15:10:23 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1024:4096
2026/07/24 15:10:23 [notice] 1#1: start worker processes
2026/07/24 15:10:23 [notice] 1#1: start worker process 29
```

## Access Logs After Browser Requests

```text
172.16.0.2 - - [24/Jul/2026:15:12:45 +0000] "GET / HTTP/1.1" 200 615 "-" "Mozilla/5.0 ..."
172.16.0.2 - - [24/Jul/2026:15:13:01 +0000] "GET / HTTP/1.1" 304 0 "-" "Mozilla/5.0 ..."
```

## Summary

These logs show that:

- The NGINX container started successfully.
- The NGINX configuration was completed.
- Worker processes started correctly.
- The container successfully served HTTP requests from a browser.
- HTTP status codes:
  - `200` → Successful response.
  - `304` → Resource not modified; browser used its cached version.