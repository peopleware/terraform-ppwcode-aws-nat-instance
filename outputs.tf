output "nat_private_ip" {
  value = "${aws_instance.nat.private_ip}"
}
