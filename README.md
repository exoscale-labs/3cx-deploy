# Deploying 3CX and Provisioning Settings via setupconfig.xml


This terraform project allows you to deploy the 3CX Phone System based on PBX, and provisionning customized settings during the cloud init stage, using different methods :
- Variable file
- User input

Some useful commands :
- Terraform plan --out  terraform.plan
- Terraform apply "terraform.plan"
- Terraform destroy

Useful links : 
https://computingforgeeks.com/how-to-install-and-configure-3cx-pbx-on-debian/


#### PS: 
This is not the recommended way to provision customised settings, but it's an easy option for Demo purpose.

## Disclaimer

This script example is provided as-is and can be modified freely. Refer to [Exoscale SKS SLA](https://community.exoscale.com/documentation/sks/overview/#service-level-and-support) to understand the limits of Exoscale Support. If you find a bug or have a suggestion/improvement to make
we welcome issues or PR in this repository but take no commitment in integrating/resolving these.