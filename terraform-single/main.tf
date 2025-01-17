# Create a VPC
resource "ibm_is_vpc" "testacc_vpc" {
  name = var.vpc
}

# ssh key
resource "ibm_is_ssh_key" "testacc_sshkey" {
  name       = var.ssh_public_key_name
  public_key = file(var.ssh_public_key)
}

# taras ssh key
data "ibm_is_ssh_key" "taras" {
  name = "tarasnew"
}
# andrii t ssh key
data "ibm_is_ssh_key" "atytarchuk" {
  name = "atytarchuk"
}

# subnetwork
resource "ibm_is_subnet" "testacc_subnet" {
  name                     = var.subnetwork_name
  vpc                      = ibm_is_vpc.testacc_vpc.id
  zone                     = local.full_zone
  total_ipv4_address_count = var.total_ipv4_address_count
}

# security group
resource "ibm_is_security_group" "testacc_security_group" {
  name = var.vsi_name
  vpc  = ibm_is_vpc.testacc_vpc.id
}

# rule that allows the VSI to make outbound connections, this is required
# to connect to the logDNA instance as well as to docker to pull the image
resource "ibm_is_security_group_rule" "testacc_security_group_rule_outbound" {
  group     = ibm_is_security_group.testacc_security_group.id
  direction = "outbound"
  remote    = "0.0.0.0/0"
}

# Configure Security Group Rule to open SSH
resource "ibm_is_security_group_rule" "testacc_security_group_rule_ssh" {
  group     = ibm_is_security_group.testacc_security_group.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 22
    port_max = 22
  }
}

# Configure Security Group Rule to open DB2
resource "ibm_is_security_group_rule" "testacc_security_group_rule_db2" {
  group     = ibm_is_security_group.testacc_security_group.id
  direction = "inbound"
  remote    = "0.0.0.0/0"
  tcp {
    port_min = 8100
    port_max = 8100
  }
}

# Images
data "ibm_is_images" "vpc_images" {
}
locals {
  image = [for image in data.ibm_is_images.vpc_images.images : image if length(regexall(local.image_name, image.name)) > 0][0]
}

# vsi
resource "ibm_is_instance" "testacc_vsi" {
  name    = "db2z1"
  #image   = local.image.id
  image = "r038-043c2fc5-0baf-4825-916b-63f4755acc30"
  profile = local.profile

  primary_network_interface {
    subnet          = ibm_is_subnet.testacc_subnet.id
    security_groups = [ibm_is_security_group.testacc_security_group.id]
  }

  vpc  = ibm_is_vpc.testacc_vpc.id
  zone = "${var.region}-${var.zone}"
  keys = [ibm_is_ssh_key.testacc_sshkey.id, data.ibm_is_ssh_key.taras.id, data.ibm_is_ssh_key.atytarchuk.id]
}

# vsi 2
resource "ibm_is_instance" "testacc_vsi_2" {
  name    = "db2z2"
  #image   = local.image.id
  image = "r038-043c2fc5-0baf-4825-916b-63f4755acc30"
  profile = local.profile

  primary_network_interface {
    subnet          = ibm_is_subnet.testacc_subnet.id
    security_groups = [ibm_is_security_group.testacc_security_group.id]
  }

  vpc  = ibm_is_vpc.testacc_vpc.id
  zone = "${var.region}-${var.zone}"
  keys = [ibm_is_ssh_key.testacc_sshkey.id, data.ibm_is_ssh_key.taras.id]
}

# Floating IP
resource "ibm_is_floating_ip" "testacc_floatingip" {
  name   = "db2z1-ip"
  target = ibm_is_instance.testacc_vsi.primary_network_interface[0].id
}

# Floating IP 2
resource "ibm_is_floating_ip" "testacc_floatingip_2" {
  name   = "db2z2-ip"
  target = ibm_is_instance.testacc_vsi_2.primary_network_interface[0].id
}
