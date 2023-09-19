resource "null_resource" "dummy" {
  provisioner "local-exec" {
    command = "${var.input_var}"
  }
}
