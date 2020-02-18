#key pair
5
provider "aws" {
access_key = "<ENTER YOUR ACCESS_KEY>"
secret_key = "<ENTER YOUR SECRET_KEY>"
region = "us-east-1"
}

(subnet,keypair,instance,vpc...)

resource "aws_instance" "example" {
ami = "ami-abc12345"
instance_type = "t2.micro"
}


variable access_key {}
variable secret_key {}
variable region {} {
default = "us-east-1"
}

variable webserver.amis {
type = "map"
}

webserver.amis {
#us-east-1
ami = "ami-abc12345"
#us-east-2
ami = "ami-abc09876"
#us-west-1
ami = "ami-cba13579"
#us-west-2
ami = "ami-cba08642"
}

5
provider "aws" {
access_key = "${var.access_key}"
secret_key = "${var.secret_key}"
region = "${var.region}"
}

resource "aws_instance" "example" {
ami = "${lookup(var.webserver.amis,$var.region)}"
instance_type = "t2.micro"
}
3
#template

"version" = "2020-07-12"
"statement" = {[
"effect" = "allow"
"action" = {
"ec2:describeinstance", "ec2:describesnapshots", "ec2:describeimage", "ec2:describetag"}
Resource ${arn}
]
}

data"template file" = webserver policy template {
template ("$file("$path module")/("policy.tpl"))"
vars {
arn="${aws_instance.web_server.arn}"
}
}



13







