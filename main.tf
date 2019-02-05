resource "aws_instance" "nat" {
  ami                         = "ami-00035f41c82244dab" # Ubuntu Server 18.04 LTS (HVM), SSD Volume Type
  instance_type               = "${var.instance_type}"
  key_name                    = "${var.key_name}"
  vpc_security_group_ids      = ["${var.security_group_ids}"]
  subnet_id                   = "${var.subnet_id}"
  associate_public_ip_address = true
  source_dest_check           = "false"
  user_data                   = "${data.template_file.init.rendered}"
}

data "template_file" "init" {
  template = "${file("${path.module}/scripts/install-nat-instance.sh")}"

    vars {
      vpc_cidr = "${var.vpc_cidr}"
  }
}
