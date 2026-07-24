# VMSS Configuration

## Scale Set: `vmss-web`
- **Resource Group**: `rg-vmss-lab`
- **Orchestration mode**: Uniform
- **Instance count**: 2 (default)
- **VM size**: Standard_B2s
- **OS**: Ubuntu 22.04 LTS
- **Custom script extension**: Installs nginx and stress
- **Load balancer**: Automatically created (public IP: `<lb-ip>`)

## Autoscale Profile
- **Name**: `autoscale-cpu`
- **Min capacity**: 2
- **Max capacity**: 5
- **Default capacity**: 2
- **Scale‑out rule**: Increase by 1 when CPU > 75% for 5 minutes
- **Scale‑in rule**: Decrease by 1 when CPU < 25% for 5 minutes