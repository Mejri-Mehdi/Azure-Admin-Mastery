# VNet Configuration – vnet-prod-eus-001

**Resource Group**: `rg-vnet-subnets`  
**Region**: East US  
**Address Space**: 10.0.0.0/16 (65,536 addresses)

## Subnets

| Subnet Name          | CIDR            | Network Address | First Usable IP | Last Usable IP  | Broadcast Address | Azure Reserved IPs | Available Host IPs |
|----------------------|-----------------|-----------------|-----------------|-----------------|-------------------|--------------------|---------------------|
| snet-web             | 10.0.1.0/24     | 10.0.1.0        | 10.0.1.4        | 10.0.1.254      | 10.0.1.255        | 10.0.1.0‑3 + 255   | 251                 |
| snet-app             | 10.0.2.0/24     | 10.0.2.0        | 10.0.2.4        | 10.0.2.254      | 10.0.2.255        | 10.0.2.0‑3 + 255   | 251                 |
| snet-db              | 10.0.3.0/24     | 10.0.3.0        | 10.0.3.4        | 10.0.3.254      | 10.0.3.255        | 10.0.3.0‑3 + 255   | 251                 |
| AzureBastionSubnet   | 10.0.4.0/26     | 10.0.4.0        | 10.0.4.4        | 10.0.4.62       | 10.0.4.63         | 10.0.4.0‑3 + 63    | 59                  |

**Azure Reserved IPs per subnet:**
- **x.x.x.0**: Network address  
- **x.x.x.1**: Default gateway (Azure)  
- **x.x.x.2**: Azure DNS (primary)  
- **x.x.x.3**: Azure DNS (secondary)  
- **x.x.x.255** (for /24 subnets): Broadcast (not usable, but reserved)

All three application subnets are /24, each with 251 usable IPs after the 5 reserved.  
The **AzureBastionSubnet** must be at least /26; we used /26, which provides 59 usable IPs.