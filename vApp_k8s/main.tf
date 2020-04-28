provider "vcd" {
  user  = var.vcd_user
  password  = var.vcd_pass
  org      = var.org
  vdc      = var.vdc
  url      = var.url
  allow_unverified_ssl = true
  max_retry_timeout = "240"
}

resource "vcd_vapp" "vApp_k8s" {
  name = "vApp_k8s"
}

resource "vcd_vapp_org_network" "dmz-network" {
  vapp_name        = vcd_vapp.vApp_k8s.name
  org_network_name = "dmz-network"
}

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