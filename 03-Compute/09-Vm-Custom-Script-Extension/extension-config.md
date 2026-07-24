# VM Custom Script Extension Configuration

## Windows VM (`vm-win-ext`)

- **Extension name:** `CustomScriptExtension` (Microsoft.Compute)
- **File URI:** `https://stgcsxyz123.blob.core.windows.net/scripts/install-iis.ps1?<SAS>`
- **Command to execute:**
  ```powershell
  powershell -ExecutionPolicy Unrestricted -File install-iis.ps1
  ```
- **Result:** IIS installed successfully and serving a custom default web page.

---

## Linux VM (`vm-linux-ext`)

- **Extension name:** `CustomScript` (Microsoft.Azure.Extensions)
- **Command to execute (inline):**
  ```bash
  apt update && \
  apt install -y nginx && \
  echo "<h1>Hello from $(hostname)</h1>" > /var/www/html/index.html && \
  systemctl restart nginx
  ```
- **Result:** Nginx installed and serving a custom web page.

---

# Key Points

- The **Custom Script Extension** requires the **Azure VM Agent**:
  - **Windows:** Windows Guest Agent
  - **Linux:** Azure Linux Agent (`waagent`)
  - Both are installed by default on Azure Marketplace images.

- The extension can:
  - Download scripts from **Azure Storage** using a **Shared Access Signature (SAS)**.
  - Execute **inline commands** directly.

- If multiple VM extensions are used, you can control their execution order (when supported) using extension sequencing.

- The script runs with **administrative privileges**:
  - **Windows:** Local System account
  - **Linux:** Root user