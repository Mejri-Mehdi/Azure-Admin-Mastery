# ExpressRoute Concepts

## What is ExpressRoute?
ExpressRoute lets you extend your on‑premises networks into the Microsoft cloud over a **private connection** facilitated by a connectivity provider. Traffic does not go over the public internet.

## Circuit and Peering
- **Circuit**: A logical connection between your on‑premises network and Azure, provisioned through a partner.
- **Peering**: Once a circuit exists, you configure one or both of:
  - **Private Peering**: Connects to Azure virtual networks. Traffic uses private IP addresses.
  - **Microsoft Peering**: Connects to Microsoft 365, Dynamics 365, and Azure PaaS services (e.g., Azure Storage, Cosmos DB) over public IP addresses.

## SKU Tiers
| SKU | Bandwidth | Geographic Reach | VNet Links | Use Case |
|-----|-----------|------------------|------------|----------|
| **Local** | 1 Gbps – 10 Gbps | One metro area | 0 included (must purchase separately) | Low cost, single region |
| **Standard** | 50 Mbps – 10 Gbps | Global connectivity | 10 per circuit | Multi‑region without premium features |
| **Premium** | 50 Mbps – 10 Gbps | Global connectivity + global reach | 100 per circuit | Large enterprise, mesh networking, Microsoft peering |

## Key Features
- **Private, dedicated connection** – no internet exposure.
- **Higher reliability** – SLA of 99.95% on dedicated circuits.
- **Lower latency** – predictable routing, often <5 ms within a metro.
- **Bandwidth options** – from 50 Mbps to 100 Gbps.
- **Global Reach** (Premium) – connect on‑premises sites directly via ExpressRoute without transiting Azure.
- **QoS** – prioritize voice/video traffic.

## Common Use Cases
- Regulatory compliance requiring private network paths.
- Large‑scale data migration or replication.
- Hybrid applications with strict latency/bandwidth needs.
- Connecting headquarters and branch offices through Azure as a hub (Global Reach).