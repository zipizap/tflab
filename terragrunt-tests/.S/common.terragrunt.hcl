locals {
  L1Dir_configs = {
    "L1a" = {
      path = "./local.backend.L1a"
    }
    "L1b" = {
      path = "./local.backend.L1b"
    }
  }
  RepoRootDir = basename(get_repo_root())                    # terragrunt-tests
  L1Dir = split("/", get_path_from_repo_root())[0]           #   L1a
  L2Dir = split("/", get_path_from_repo_root())[1]           #     L2a
}

}

remote_state {
  backend = "local"
  config = {
    path = local.L1Dir_configs[local.L1Dir].path
  }
  generate = {
    path      = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}

terraform {
  source = "${get_parent_terragrunt_dir()}/dummy_module"
}
