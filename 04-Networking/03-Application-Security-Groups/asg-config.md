# Application Security Group Configuration

## ASGs Created
- **asg-web-servers**: Contains VMs `vm-web1`, `vm-web2` (NICs)
- **asg-app-servers**: Contains VMs `vm-app1`, `vm-app2`, `vm-app3` (NICs)

## VMs and ASG Assignments
| VM Name    | NIC Name         | ASG                |
|------------|------------------|--------------------|
| vm-web1    | vm-web1VMNic     | asg-web-servers    |
| vm-web2    | vm-web2VMNic     | asg-web-servers    |
| vm-app1    | vm-app1VMNic     | asg-app-servers    |
| vm-app2    | vm-app2VMNic     | asg-app-servers    |
| vm-app3    | vm-app3VMNic     | asg-app-servers    |

## How Assignment Works
- ASGs are attached to the primary IP configuration of each NIC using:
  ```powershell
  az network nic ip-config update --application-security-groups <asg-name>