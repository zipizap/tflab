include "common" { 
    path = "../../.S/common.terragrunt.hcl" 
}

include "L1a" {
  path = "../../.S/L1a.terragrunt.hcl"
}

# # The file can override any parameter also set in parent includ'ed files.
# # Like the terraform.source, if its usefull for a migration ;)
# terraform {
#   source = "${get_parent_terragrunt_dir("L1a")}/dummy_module-ver2"
# }


inputs = {
  input_var = <<-EOT
    echo 
    echo "get_repo_root:               '${get_repo_root()}'"
    echo "get_path_from_repo_root      '${get_path_from_repo_root()}'"
    echo "get_path_to_repo_root        '${get_path_to_repo_root()}'"
    echo "get_terragrunt_dir           '${get_terragrunt_dir()}'"
    echo "get_parent_terragrunt_dir    '${get_parent_terragrunt_dir("L1a")}'"
    echo "get_original_terragrunt_dir  '${get_original_terragrunt_dir()}'"
    echo
  EOT
}
