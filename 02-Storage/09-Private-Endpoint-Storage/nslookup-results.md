# DNS Resolution: Public vs Private

## From the VM (inside VNet)

nslookup prvendxyz123.blob.core.windows.net
Server: 127.0.0.53
Address: 127.0.0.53#53

Non-authoritative answer:
Name: prvendxyz123.blob.core.windows.net
Address: 10.1.0.4

**Observation**: The FQDN resolves to the private IP of the private endpoint. Traffic stays within the Azure backbone.

## From Local Machine (public internet)

nslookup prvendxyz123.blob.core.windows.net
Server: UnKnown
Address: 192.168.1.1

Non-authoritative answer:
Name: prvendxyz123.privatelink.blob.core.windows.net
Address: 20.150.47.132

**Observation**: The FQDN resolves to a public IP of the blob service. However, because public network access is denied, connections will be blocked.

**Conclusion**: Private DNS zone integration automatically overrides the public DNS when resolving from within the linked VNet. This is the foundation for private access to PaaS services.