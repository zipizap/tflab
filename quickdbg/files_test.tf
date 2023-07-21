# Testing {for k,v ... if} and for_each
#
# 


terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.4.0"
    }
  }
}

provider "local" {
  # Configuration options
}


locals {
  myfiles_all = {
    "myfileBlue.txt" = {
        content = "myfileBlue content"
        permissions = "0600"
        color = "blue"
    }
    "myfileRed.txt" = {
        content = "myfileRed content"
        permissions = "0600"
        color = "red"
    }
    "myfileNone.txt" = {
        content = "myfileNone content"
        permissions = "0600"
        #color = "none"
    }
  }
}

# all files
resource "local_file" "files_all" {
  for_each = local.myfiles_all
  content  = each.value.content
  filename = "${path.module}/files_all/${each.key}"
  file_permission = each.value.permissions
}
output "files_all" {
    value = {
        for a_filename, a_val in local_file.files_all: a_filename => a_val.content_md5
    }
}



# filter color="blue" files
locals {
  # { for ... if}   https://developer.hashicorp.com/terraform/language/v1.1.x/expressions/for
  myfiles_blue = { 
    for k, v in local.myfiles_all : k => v
    if lookup(v, "color", "") == "blue"
    # NOTE lookup() is used so it works when .color parameter is not defined in an object, as it happens with "myfileNone.txt"
  }
}
resource "local_file" "files_blue" {
  # for_each     https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = local.myfiles_blue
  content  = each.value.content
  filename = "${path.module}/files_blue/${each.key}"
  file_permission = each.value.permissions
}

output "files_blue" {
    value = {
        for a_filename, a_val in local_file.files_blue: a_filename => a_val.content_md5
    }
}


