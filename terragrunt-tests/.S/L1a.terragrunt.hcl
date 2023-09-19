remote_state {
  backend = "local"
  config = {
    path = "./local.backend"
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

# inputs = {
#   input_var = <<-EOT
#     echo 
#     echo "INPUT IN L1a.terragrunt.hcl"
#     echo
#   EOT
# }


# inputs = {
#   input_var = <<-EOT
#     echo 
#     echo "get_repo_root:               '${get_repo_root()}'"
#     echo "get_path_from_repo_root      '${get_path_from_repo_root()}'"
#     echo "get_path_to_repo_root        '${get_path_to_repo_root()}'"
#     echo "get_terragrunt_dir           '${get_terragrunt_dir()}'"
#     echo "get_parent_terragrunt_dir    '${get_parent_terragrunt_dir()}'"
#     echo "get_original_terragrunt_dir  '${get_original_terragrunt_dir()}'"
#     echo
#   EOT
# }

