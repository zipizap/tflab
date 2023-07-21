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


# create local file
resource "local_file" "mylocalfile" {
  content  = "mylocalfile contents here!"
  filename = "${path.module}/mylocalfile.txt"
  file_permission = "0600"
}