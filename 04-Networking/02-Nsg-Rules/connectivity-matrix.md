# Connectivity Test Matrix

| Source               | Destination      | Protocol/Port | Expected Result | Actual Result | Rule(s) at Play |
|----------------------|------------------|---------------|-----------------|---------------|-----------------|
| Internet (your PC)   | vm-web (public IP)| HTTP (80)     | ✅ Allowed      | ✅            | nsg-web/AllowHTTP (100) |
| Internet (your PC)   | vm-web (public IP)| SSH (22)      | ❌ Denied       | ❌            | Implicit deny; no rule allows SSH from Internet |
| Internet (your PC)   | vm-web (public IP)| RDP (3389)    | ✅ Allowed      | ✅            | nsg-web/AllowRDP (4000) – your IP whitelisted |
| vm-app (10.0.2.x)    | vm-web (10.0.1.x) | SSH (22)      | ✅ Allowed      | ✅            | nsg-web/AllowSSHfromApp (120) or AllowVnetInBound |
| vm-app (10.0.2.x)    | vm-web (10.0.1.x) | HTTP (80)     | ✅ Allowed*     | ✅            | AllowVnetInBound (default rule) |
| vm-web (10.0.1.x)    | vm-db (10.0.3.x)  | SQL (1433)    | ❌ Denied       | ❌            | nsg-db/DenyWebInbound (110) |
| vm-app (10.0.2.x)    | vm-db (10.0.3.x)  | SQL (1433)    | ✅ Allowed      | ✅            | nsg-db/AllowSQLfromApp (100) |