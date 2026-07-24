# VM Custom Script Extension

## What is a VM Extension?
VM extensions are small applications that provide post‑deployment configuration and automation tasks on Azure VMs. The **Custom Script Extension** allows you to run arbitrary scripts after a VM is provisioned, enabling you to install software, configure settings, or bootstrap applications without manual intervention.

## How It Works
- The extension downloads the script (from Azure Storage, GitHub, or any public URL) and executes it inside the VM.
- On Windows, it uses PowerShell or command prompt.
- On Linux, it uses bash.
- The extension reports success/failure to the Azure platform.

## Use Cases
- **Automatic software installation**: Install web servers, agents, or monitoring tools.
- **Configuration management**: Set registry keys, edit config files, or run configuration commands.
- **Bootstrapping**: Join a domain, configure networking, or mount file shares.

## Our Implementation
- **Windows**: Uploaded `install-iis.ps1` to Azure Blob Storage, granted SAS access, and used the Custom Script Extension to run it. The script installed IIS and created a simple homepage.
- **Linux**: Used an inline command to install nginx and create a custom index page.

## Comparing Extensions vs. Custom Images
| Approach | Pros | Cons |
|----------|------|------|
| Custom Script Extension | Flexible, can change scripts without rebuilding image; easy to test. | Script runs every time a VM is created; adds deployment time. |
| Custom Image (Packer) | Faster deployment, consistent configuration baked in. | Requires image management; changes need image rebuild. |

For production, consider using a combination: a custom image for the base OS and critical software, and the Custom Script Extension for final configuration that changes often.

## Screenshots

---
![alt text](<Screenshot 2026-07-24 163448.png>)
---
![alt text](<Screenshot 2026-07-24 163438.png>)
---
![alt text](<Screenshot 2026-07-24 163515.png>)
---
![alt text](<Screenshot 2026-07-24 163421.png>)
---

## Lessons Learned
- Custom Script Extension simplifies VM configuration.  
- Scripts can be reused across environments.  
- Execution order must be carefully planned.  