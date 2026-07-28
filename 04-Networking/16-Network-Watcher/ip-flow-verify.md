# IP Flow Verify Results

| Source IP   | Dest IP     | Port | Protocol | Direction | Result | Rule |
|-------------|-------------|------|----------|-----------|--------|------|
| 10.100.1.4 (VM1) | 10.100.1.5 (VM2) | 3389 | TCP | Inbound | Allowed | AllowRDP (priority 100) |
| 10.100.1.5 (VM2) | 10.100.1.4 (VM1) | *    | ICMP | Inbound | Denied  | DenyICMPfromVM2 (priority 200) |
| 10.100.1.4 (VM1) | 10.100.1.5 (VM2) | 22   | TCP | Inbound | Denied  | Default deny (no allow rule) |

**Insight:** IP Flow Verify confirms whether an NSG rule allows or blocks a specific flow. It’s the first tool to use when a VM can’t reach another resource.