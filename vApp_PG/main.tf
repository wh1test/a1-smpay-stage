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

resource "vcd_vapp" "vApp_PG" {
  name = "vApp_PG"
}

resource "vcd_vapp_org_network" "inside-network" {
  vapp_name        = vcd_vapp.vApp_PG.name
  org_network_name = "inside-network"
}

resource "vcd_vapp_vm" "smpay-t-db-1" {
  vapp_name     = "vApp_PG"
  name          = "smpay-t-pg-1"
  computer_name = "smpay-t-pg-1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "db"
    env     = "stage"
    version = "1.0"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.inside-network.org_network_name
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
}
 
resource "vcd_vapp_vm" "smpay-t-pg-2" {
  vapp_name     = "vApp_PG"
  name          = "smpay-t-pg-2"
  computer_name = "smpay-t-pg-2"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "db"
    env     = "stage"
    version = "1.0"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.inside-network.org_network_name
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
}

resource "vcd_vapp_vm" "smpay-t-pg-3" {
  vapp_name     = "vApp_PG"
  name          = "smpay-t-pg-3"
  computer_name = "smpay-t-pg-3"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "db"
    env     = "stage"
    version = "1.0"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.inside-network.org_network_name
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
}