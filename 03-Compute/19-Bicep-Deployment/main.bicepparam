using './main.bicep'

param vmName = 'bicep-mod-vm'
param adminUsername = 'azureadmin'
param adminPassword = readEnvironmentVariable('ADMIN_PASSWORD')
param vmSize = 'Standard_D2lds_v7'
