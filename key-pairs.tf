resource "aws_key_pair" "deployer-daas" {
  key_name = "daas-dev-deployer-key"
  public_key = "${file(\"ssh/daas-dev-deployer-key.pub\")}"
}
