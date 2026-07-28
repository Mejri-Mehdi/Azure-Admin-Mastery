# DNS Resolution: Private Endpoint

## From VM inside VNet

**Command:**
```bash
nslookup stgpexyz123.blob.core.windows.net
```

**Output:**
```text
Server:         127.0.0.53
Address:        127.0.0.53#53

Non-authoritative answer:
Name:    stgpexyz123.blob.core.windows.net
Address: 10.70.1.5
```

**Analysis:**  
✅ Resolves to the **private IP address** of the Private Endpoint.

---

## From Local Machine (Outside the VNet)

**Command:**
```bash
nslookup stgpexyz123.blob.core.windows.net
```

**Output:**
```text
Name:    stgpexyz123.blob.core.windows.net
Address: 20.150.47.132
```

**Analysis:**  
✅ Resolves to the **public IP address** of the Azure Storage service.

---

## Why the Difference?

The Private DNS zone `privatelink.blob.core.windows.net` is linked to the virtual network `vnet-pe`. As a result, DNS queries originating **inside** the VNet are resolved to the **Private Endpoint's private IP address**. DNS queries originating **outside** the VNet use Azure's public DNS and therefore resolve to the **public IP address** of the storage service.