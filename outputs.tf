output "app-daas.0.ip" {
  value = "${aws_instance.app-daas.0.private_ip}"
}

output "app-daas.1.ip" {
  value = "${aws_instance.app-daas.1.private_ip}"
}
