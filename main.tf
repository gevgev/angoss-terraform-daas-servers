provider "aws" {
  access_key  = "${var.access_key}"
  secret_key  = "${var.secret_key}"
  region      = "${var.region}"
}

/* App servers *
resource "aws_instance" "angoss-server" {
  count = "${var.instances}"
  ami = "${lookup(var.amis-angoss, var.region)}"
  instance_type = "m4.xlarge"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  key_name = "${aws_key_pair.dev-deployer.key_name}"
  source_dest_check = false
  tags = { 
    Name = "angoss-app-server-${count.index}"
  }
}
*/
/* App servers */
resource "aws_instance" "app-daas" {
  count = "${var.instances}"
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.vpc_security_group_id}"]
  key_name = "${aws_key_pair.deployer-daas.key_name}"
  source_dest_check = false
  /* the user_data installs Docker
  user_data = "${file(\"cloud-config/app.yml\")}"
  */
  tags = { 
    Name = "daas-app-${count.index}"
  }
}
