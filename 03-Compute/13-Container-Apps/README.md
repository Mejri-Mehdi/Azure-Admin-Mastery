# Azure Container Apps vs ACI vs AKS

| Feature | Container Apps | ACI | AKS |
|---------|----------------|-----|-----|
| **Orchestration** | Managed Kubernetes (KEDA, Envoy, Dapr) | None | Full Kubernetes control |
| **Scaling** | Event‑driven autoscale (HTTP, CPU, custom metrics) | Manual | Cluster autoscaler, HPA |
| **Serverless** | Yes (scales to zero) | Yes (per‑second billing) | No (nodes always running) |
| **Use cases** | Microservices, event‑driven apps, APIs | Simple containers, batch jobs | Complex orchestration, large clusters |
| **Networking** | Virtual network integration, ingress | Public or private IP | Full CNI, network policies |
| **Management** | Fully managed | Fully managed | Cluster management required |

## When to Use Each
- **Container Apps**: You want a serverless, event‑driven microservice platform with automatic scaling and revision management, without managing Kubernetes.
- **ACI**: You need to quickly run a container for a short task or a simple website with minimal configuration.
- **AKS**: You need full Kubernetes control for complex, multi‑tier applications with custom scheduling, storage, and networking.

## Our Lab
- Created a Container Apps Environment and deployed an Nginx container from our private ACR.
- Configured external ingress and HTTP‑based scaling (concurrent requests > 10).
- Verified that the app scaled from 0 to 3 replicas under load, and scaled back to zero when idle.
- Exported the configuration and demonstrated revision management.

## Screenshot

---



## Lessons Learned
- Container Apps simplify Kubernetes for developers.  
- Autoscaling ensures performance and cost efficiency.  
- Revision management enables safe 