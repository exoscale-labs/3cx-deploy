data "exoscale_compute_template" "debian" {
  zone = var.zone
  name = "Linux Debian 10 (Buster) 64-bit"
}

data "template_file" "setupconfig" {
  template = file("scripts/setupconfig.sh")
  vars = {
    adminemail      = "email@exoscale.com"
    operatorfirstname   = var.operatorfirstname
    adminpassword   = var.adminpassword
  }
}

data "template_file" "install" {
  template = file("scripts/install.sh")
}

data "template_cloudinit_config" "PBX" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.setupconfig.rendered
  }

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.install.rendered
  }
}

resource "exoscale_compute_instance" "phonesystem" {
  zone = var.zone
  name = "phonesys"
  template_id = data.exoscale_compute_template.debian.id
  instance_type = var.instance_type
  disk_size = 50
  key_pair = var.ssh_key
  instance_prefix = "pbx"
  security_group_ids = [exoscale_security_group.phonesysg.id]
  user_data = base64encode(data.template_cloudinit_config.PBX.rendered)

  labels = {
    app = "phonesys"
    env = "test"
  }

  timeouts {
    delete = "10m"
  }
}
