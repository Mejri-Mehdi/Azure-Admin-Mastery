# VM Deployment via Azure CLI

This module recreates the portal‑based VM deployment entirely with Azure CLI, giving you full control over each resource.

## Command Breakdown

| Command | Purpose |
|---------|---------|
| `az group create` | Creates the resource group container. |
| `az network vnet create` | Creates the virtual network and one subnet. The `--address-prefix` and `--subnet-prefix` define the IP space. |
| `az network nsg create` | Creates a Network Security Group. |
| `az network nsg rule create` | Adds inbound rules for RDP (3389) and SSH (22). |
| `az network vnet subnet update` | Links the NSG to the subnet, so all VMs in that subnet are protected. |
| `az network public-ip create` | Creates Standard SKU, static public IPs. Standard SKU provides zone‑redundancy and better security. |
| `az network nic create` | Creates a NIC, attaches it to the subnet and public IP. |
| `az vm create` | Deploys the VM using the pre‑created NIC, OS image, disk type, and boot diagnostics. For Linux, `--generate-ssh-keys` creates a local key pair and stores the public key in the VM. |
| `az vm open-port` (optional) | Adds an NSG rule to an existing NSG associated with the VM’s NIC – here we already defined rules at the subnet. |

## Why Explicit Resource Creation?
- **Granular control**: You can name every resource, choose static IPs, and reuse them across deployments.
- **Idempotency**: All commands are safe to run multiple times; they either create or update (no duplicate resources if parameters match).
- **Separation of concerns**: Network and compute layers are managed independently.
- **Production readiness**: In real environments, networking is often managed by a separate team.

## Comparison: Portal vs CLI
- Portal is good for initial exploration and ad‑hoc tasks.
- CLI enables **scripting, automation, and version control**. This script can be saved as infrastructure‑as‑code.

## Authentication Differences
- **Windows**: Uses a username and password. The password must meet complexity requirements.
- **Linux**: Uses SSH key pairs (more secure than passwords). `--generate-ssh-keys` creates `~/.ssh/id_rsa` and `~/.ssh/id_rsa.pub` if they don’t exist.

## Screenshot
---
![alt text](<Screenshot 2026-07-23 190414.png>)
---

## Lessons Learned
- CLI provides automation and repeatability.  
- Explicit resource creation ensures predictable configurations.  
- NSG rules must be carefully managed for security.  