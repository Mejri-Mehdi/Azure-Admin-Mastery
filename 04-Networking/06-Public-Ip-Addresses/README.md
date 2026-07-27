# Public IP Addresses in Azure

## Overview
Public IP addresses allow Azure resources to communicate with the Internet. They come in two SKUs: Basic (legacy) and Standard (recommended).

## Basic vs Standard SKU
- **Basic**: Designed for simple deployments. It does not support availability zones, has open inbound by default (you must secure the resource separately), and cannot be used with standard load balancers.
- **Standard**: Built for high availability and security. It is always static, supports zones, and requires a Network Security Group to allow inbound traffic. It integrates with all modern Azure services.

## Static vs Dynamic Allocation
- **Dynamic**: The IP is assigned from a pool and may change when the resource is stopped/deallocated. Basic SKU allows dynamic; Standard does not.
- **Static**: The IP is fixed and survives stop/start cycles. Standard SKU always uses static.

## Public IP Prefix
A public IP prefix provides a **reserved, contiguous block** of Standard public IP addresses. This is extremely useful when you need to whitelist Azure IPs on an external firewall — you can give the entire prefix range, and any new IPs you create from it will fall within that range.

## Our Lab
- Created a Basic SKU public IP (where available) and a Standard SKU public IP.
- Attached each to a test VM to observe the differences in configuration.
- Created a public IP prefix of length /31 and allocated an IP from it.
- Documented the key distinctions, including zone support, security posture, and use cases.

## Best Practices
- Always use **Standard SKU** for new deployments.
- Plan your IP addressing: use **public IP prefixes** when you need predictable IP ranges.
- Secure your public IPs with **Network Security Groups** and consider using Azure Firewall or WAF for additional protection.

## Screenshots

---
![alt text](<Screenshot 2026-07-27 093128.png>)
---
![alt text](<Screenshot 2026-07-27 093133.png>)
---
![alt text](<Screenshot 2026-07-27 094424.png>)
---
![alt text](<Screenshot 2026-07-27 094854.png>)
---

## Lessons Learned
- Standard SKU is best practice for production workloads.  
- Public IP prefixes simplify firewall whitelisting.  
- NSG enforcement ensures inbound traffic security.  