output "nat_private_ip" {
  value = "${aws_instance.nat.private_ip}"
}

output "nat_instance_id" {
  value = "${aws_instance.nat.id}"
}
