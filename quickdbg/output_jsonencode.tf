
locals {
  localmap = {
    "key1" = "val1"
    "key2" = "val2"
  }

}


output "localmap_native" {
  value = local.localmap
}

output "localmap_json" {
  value = jsonencode(local.localmap)
}

output "localmap_yaml" {
  value = yamlencode(local.localmap)
}