# Azure Portal Navigation Walkthrough

## Overview
This walkthrough documents the core interfaces and essential features of the Azure Portal.  
It highlights navigation paths, dashboard customization, Cloud Shell usage, and resource visualization.

---

## Steps Completed
1. Logged into [portal.azure.com](https://portal.azure.com).
2. Navigated to:
   - **Subscriptions**
   - **Resource Groups**
   - **All Resources**
   - **Cost Management + Billing**
3. Pinned to dashboard:
   - Resource Groups
   - Virtual Machines
   - Storage Accounts
   - Virtual Networks
4. Used the **global search bar** to locate resources by name.
5. Opened **Cloud Shell (Bash)**:
   - Storage account created automatically.
   - Region noted during provisioning.
6. Switched Cloud Shell to **PowerShell**:
   - Observed prompt differences between Bash and PowerShell.
7. Enabled **Resource Visualizer (Preview)** on a Resource Group.

---

## Key Concepts
- **Azure Portal = Management Plane**  
  Every action in the portal is an API call to Azure Resource Manager (ARM).

- **Cloud Shell**  
  - Runs inside a temporary container.  
  - Mounts persistent storage via an automatically created storage account.  
  - Supports both Bash and PowerShell environments.

- **Dashboard Customization**  
  Pinning frequently used resources improves efficiency and visibility.

- **Resource Visualizer**  
  Provides a graphical view of dependencies and relationships inside a Resource Group.

---

## Deliverables
- **README.md** (this file) with documentation and screenshots of pinned dashboard.  
- **notes.md** with 10 keyboard shortcuts and portal tricks.  
- Screenshot of Cloud Shell storage account creation.

---

## Lessons Learned
- Efficient navigation through **Subscriptions, Resource Groups, and All Resources** is foundational.  
- **Global search** accelerates resource discovery.  
- **Cloud Shell** bridges CLI and portal, ensuring persistent storage while running in ephemeral containers.  
- **Resource Visualizer** enhances understanding of resource dependencies.  
- Every portal interaction is backed by **Azure Resource Manager APIs**, reinforcing the importance of ARM in automation and DevOps.

---

## Next Steps
- Explore **Azure CLI** and **Azure PowerShell** beyond Cloud Shell.  
- Automate dashboard setup with ARM templates.  
- Practice cost analysis with **Cost Management + Billing**.

## Screenshots

![alt text](<Screenshot 2026-07-11 221135.png>) ![alt text](<Screenshot 2026-07-11 221209.png>) ![alt text](<Screenshot 2026-07-11 221527.png>) ![alt text](<Screenshot 2026-07-11 222541.png>)