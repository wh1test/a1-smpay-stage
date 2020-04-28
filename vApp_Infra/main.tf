provider "vcd" {
  version = "2.8.0"
  user  = var.vcd_user
  password  = var.vcd_pass
  org      = var.org
  vdc      = var.vdc
  url      = var.url
  allow_unverified_ssl = true
  max_retry_timeout = "240"
}

resource "vcd_vapp" "vApp_Infra" {
  name = "vApp_Infra"
}

resource "vcd_vapp_org_network" "infra-network" {
  vapp_name        = vcd_vapp.vApp_Infra.name
  org_network_name = "infra-network"
}

resource "vcd_independent_disk" "gitDisk1" {
  name         = "gitDisk1"
  size         = "5000"
  bus_type     = "SCSI"
  bus_sub_type = "VirtualSCSI"
  storage_profile = "c01-cl02-Tier-2"
}

resource "vcd_vapp_vm" "smpay-t-gitlab-1" {
  vapp_name     = "vApp_Infra"
  name          = "smpay-t-gitlab-1"
  computer_name = "smpay-t-gitlab-1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "git"
    env     = "stage"
    version = "1.0"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.infra-network.org_network_name
    ip_allocation_mode = "POOL"
    ip                 = ""
    is_primary         = true
  }
  
  customization {
    force                      = false
    change_sid                 = false
    allow_local_admin_password = false
    auto_generate_password     = false
    # Other customization options to override the ones from template
  }
  
#  disk {
#    name        = vcd_independent_disk.gitDisk1.name
#    bus_number  = 1
#    unit_number = 0
#  }
}
