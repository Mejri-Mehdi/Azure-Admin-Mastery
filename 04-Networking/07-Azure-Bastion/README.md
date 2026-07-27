# Azure Bastion – Secure Remote Access Without Public IPs

## What is Azure Bastion?
Azure Bastion is a fully managed PaaS service that provides secure, seamless RDP and SSH access to virtual machines directly from the Azure portal, over TLS (port 443). It eliminates the need to expose VMs to the public internet via public IP addresses and NSG rules.

## Bastion vs. Traditional Jump Box
| Aspect | Bastion | Jump Box (traditional) |
|--------|---------|------------------------|
| **Management** | Fully managed (PaaS) | You manage a VM (OS updates, patching, security) |
| **Public exposure** | Only the Bastion host has a public IP; target VMs have none | Jump box has a public IP; it must be hardened |
| **Authentication** | Integrated with Azure AD and SSH keys / passwords | Typically requires RDP/SSH, often with shared credentials |
| **Scaling** | Automatically scales (Standard up to 50 sessions) | Fixed capacity; you must add more VMs |
| **File transfer / clipboard** | Built‑in (Standard SKU) | Requires manual setup |
| **Cost** | Pay for the Bastion host (per hour) + outbound data | Pay for the jump box VM |

## SKUs: Basic vs Standard
- **Basic** (deprecated – being replaced by Standard): 2 concurrent sessions, no file transfer, no native client support. Not recommended for new deployments.
- **Standard**: Up to 50 concurrent sessions, file transfer, copy‑paste, native client support (RDP/SSH from your local client through Bastion), host scaling.

## Our Implementation
- Deployed a VNet with the mandatory `AzureBastionSubnet` (size /26).
- Created a Linux VM without a public IP.
- Provisioned a Standard Bastion host.
- Connected via the Azure portal’s Bastion interface, transferred files, and tested clipboard integration.

## Security Benefits
- **No public IPs on VMs** – reduces attack surface.
- **All traffic flows over HTTPS (443)** – no need to open RDP (3389) or SSH (22) on NSGs.
- **Integrated with Azure AD** and can enforce Conditional Access policies (when used with Azure AD authentication for Windows VMs).
- **Session logs** available in Azure Monitor.

## Screenshots

---
---
---
---
---
---
---
---
---


## Lessons Learned
- Bastion eliminates need for jump boxes.  
- Standard SKU provides enterprise features.  
- Secure connectivity without exposing VMs to Internet.  