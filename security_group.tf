resource "exoscale_security_group" "phonesysg" {
  name             = "phonesysg"
  description      = "3CX phone system based PBX - SG"
}


resource "exoscale_security_group_rule" "https" {
  security_group_id = exoscale_security_group.phonesysg.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0" 
  start_port        = 5001
  end_port          = 5001
}

resource "exoscale_security_group_rule" "http" {
  security_group_id = exoscale_security_group.phonesysg.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0" 
  start_port        = 5000
  end_port          = 5000
}

resource "exoscale_security_group_rule" "sip" {
  security_group_id = exoscale_security_group.phonesysg.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0" 
  start_port        = 5060
  end_port          = 5060
}

resource "exoscale_security_group_rule" "tunnel" {
  security_group_id = exoscale_security_group.phonesysg.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0" 
  start_port        = 5090
  end_port          = 5090
}

resource "exoscale_security_group_rule" "ssh" {
  security_group_id = exoscale_security_group.phonesysg.id
  type              = "INGRESS"
  protocol          = "TCP"
  cidr              = "0.0.0.0/0" 
  start_port        = 22
  end_port          = 22
}