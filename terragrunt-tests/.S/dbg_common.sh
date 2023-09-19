set -x
clear
rm -rf .terraform.lock.hcl .terragrunt-cache &>/dev/null 
terragrunt apply --terragrunt-config=common.terragrunt.hcl -auto-approve
rm -rf .terraform.lock.hcl .terragrunt-cache &>/dev/null 

