# Traceroute from Workload VM

**Command:** `traceroute 8.8.8.8`

**Output:**

```text
1 10.0.2.4 (10.0.2.4) 1.234 ms 1.123 ms 1.098 ms
2 * * *
3 * * *
...
```

**Analysis:**

The first hop is the NVA’s private IP (10.0.2.4), confirming that traffic to the internet is routed through the NVA as specified by the UDR. Subsequent hops may be hidden because ICMP responses are blocked, but the presence of the NVA as the first gateway proves that the UDR routing configuration is working correctly.