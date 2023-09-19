set -x
clear
rm -rf .terraform.lock.hcl .terragrunt-cache &>/dev/null 
terragrunt apply -auto-approve
rm -rf .terraform.lock.hcl .terragrunt-cache &>/dev/null 

