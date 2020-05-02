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

resource "vcd_vapp" "vApp_k8s" {
  name = "vApp_k8s"
}

resource "vcd_vapp" "vApp_L7LB" {
  name = "vApp_L7LB"
}

resource "vcd_vapp" "vApp_web" {
  name = "vApp_web"
}

resource "vcd_vapp" "vApp_PG" {
  name = "vApp_PG"
}

resource "vcd_vapp_org_network" "inside-network" {
  vapp_name        = vcd_vapp.vApp_PG.name
  org_network_name = "inside-network"
}

resource "vcd_vapp_org_network" "dmz-network" {
  vapp_name        = vcd_vapp.vApp_L7LB.name
  org_network_name = "dmz-network"
}

resource "vcd_vapp_org_network" "infra-network" {
  vapp_name        = vcd_vapp.vApp_Infra.name
  org_network_name = "infra-network"
}

#resource "vcd_independent_disk" "gitDisk1" {
#  name         = "gitDisk1"
#  size         = "25000"
#  bus_type     = "SCSI"
#  bus_sub_type = "VirtualSCSI"
#  storage_profile = "c01-cl02-Tier-2"
#}

###### vApp_L7LB ######
resource "vcd_vapp_vm" "smpay-t-l7lb-1" {
  vapp_name     = "vApp_L7LB"
  name          = "smpay-t-l7lb-1"
  computer_name = "smpay-t-l7lb-1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-2"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "l7lb"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-l7lb-2" {
  vapp_name     = "vApp_L7LB"
  name          = "smpay-t-l7lb-2"
  computer_name = "smpay-t-l7lb-2"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-2"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "l7lb"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-l7lb-3" {
  vapp_name     = "vApp_L7LB"
  name          = "smpay-t-l7lb-3"
  computer_name = "smpay-t-l7lb-3"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-2"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "l7lb"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

##### vApp_web ######
resource "vcd_vapp_vm" "smpay-t-app-1" {
  vapp_name     = "vApp_web"
  name          = "smpay-t-app-1"
  computer_name = "smpay-t-app-1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-1"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "app"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-app-2" {
  vapp_name     = "vApp_web"
  name          = "smpay-t-app-2"
  computer_name = "smpay-t-app-2"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-1"
  memory        = 1024
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "app"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

######## vApp_L7Lb #########
resource "vcd_vapp_vm" "smpay-t-k8s-master1" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-master1"
  computer_name = "smpay-t-k8s-master1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-k8s-master2" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-master2"
  computer_name = "smpay-t-k8s-master2"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-k8s-master3" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-master3"
  computer_name = "smpay-t-k8s-master3"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-k8s-node1" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-node1"
  computer_name = "smpay-t-k8s-node1"
  catalog_name  = var.template_folder
  template_name = "c8-k8s-node-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

  lifecycle {
    prevent_destroy = true
  }
}

resource "vcd_vapp_vm" "smpay-t-k8s-node2" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-node2"
  computer_name = "smpay-t-k8s-node2"
  catalog_name  = var.template_folder
  template_name = "c8-k8s-node-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

resource "vcd_vapp_vm" "smpay-t-k8s-node3" {
  vapp_name     = "vApp_k8s"
  name          = "smpay-t-k8s-node3"
  computer_name = "smpay-t-k8s-node3"
  catalog_name  = var.template_folder
  template_name = "c8-k8s-node-tmpl-a1"
  memory        = 2048
  cpus          = 1
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "k8s"
    env     = "stage"
    version = "1.0"
    os  = "linux"
  }

  network {
    type               = "org"
    name               = vcd_vapp_org_network.dmz-network.org_network_name
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

###### vApp_Infra ######
resource "vcd_vapp_vm" "smpay-t-gitlab-1" {
  vapp_name     = "vApp_Infra"
  name          = "smpay-t-gitlab-1"
  computer_name = "smpay-t-gitlab-1"
  catalog_name  = var.template_folder
  template_name = "c8-web-tmpl-a1"
  storage_profile = "c01-cl02-Tier-2"
  memory        = 4096
  cpus          = 2
  cpu_cores     = 1
  power_on      = true

  metadata = {
    role    = "git"
    env     = "stage"
    version = "1.0"
    os  = "linux"
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

  lifecycle {
    prevent_destroy = true
  }
  
 # disk {
 #   name        = vcd_independent_disk.gitDisk1.name
 #   bus_number  = 1
 #   unit_number = 0
 # }
}

###### vApp_PG ######
resource "vcd_vapp_vm" "smpay-t-pg-1" {
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
    os  = "linux"
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
  
  lifecycle {
    prevent_destroy = true
  }
}