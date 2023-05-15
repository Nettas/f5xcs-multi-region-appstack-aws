# # Initialize availability zone data from AWS
# data "aws_availability_zones" "available" {}

resource "volterra_aws_vpc_site" "example" {
  # count      = length(data.aws_availability_zones.available.names)
  name = var.name
  # name        = format("%s-ssexcaws-1", var.projectprefix)
  namespace  = "system"
  aws_region = var.region

  vpc {
    new_vpc {
      autogenerate = true
      primary_ipv4 = "10.0.0.0/21"
    }
  }

  // One of the arguments from this list "default_blocked_services blocked_services" must be set
  default_blocked_services = true

  // One of the arguments from this list "aws_cred" must be set

  aws_cred {
    name      = var.cred
    namespace = "system"
    tenant    = var.tenant
  }
  // One of the arguments from this list "direct_connect_disabled direct_connect_enabled" must be set
  direct_connect_disabled = true
  instance_type           = var.instance
  // One of the arguments from this list "disable_internet_vip enable_internet_vip" must be set
  disable_internet_vip = true
  // One of the arguments from this list "logs_streaming_disabled log_receiver" must be set
  logs_streaming_disabled = true

  offline_survivability_mode {
    enable_offline_survivability_mode = true
  }
  // One of the arguments from this list "ingress_gw ingress_egress_gw voltstack_cluster" must be set

  voltstack_cluster {
    allowed_vip_port {
      // One of the arguments from this list "use_http_port use_https_port use_http_https_port custom_ports" must be set
      use_http_port = true
    }

    aws_certified_hw = "aws-byol-voltstack-combo"

    az_nodes {
      aws_az_name = var.az1
      disk_size   = "80"
      local_subnet {
        subnet_param {
          # ipv4 = "10.0.0.0/24"
          ipv4 = var.subnet1
        }
      }
    }
    az_nodes {
      aws_az_name = var.az2
      disk_size   = "80"
      local_subnet {
        subnet_param {
          # ipv4 = "10.0.1.0/24"
          ipv4 = var.subnet2
        }
      }
    }
    az_nodes {
      aws_az_name = var.az3
      disk_size   = "80"
      local_subnet {
        subnet_param {
          # ipv4 = "10.0.2.0/24"
          ipv4 = var.subnet3
        }
      }
    }

    k8s_cluster {
      namespace = "system"
      name      = volterra_k8s_cluster.aws_sse.name
    }
    # performance_enhancement_mode {
    #   // One of the arguments from this list "perf_mode_l7_enhanced perf_mode_l3_enhanced" must be set
    #   perf_mode_l7_enhanced = true
    # }
  }
  // One of the arguments from this list "no_worker_nodes nodes_per_az total_nodes" must be set
  # nodes_per_az = "1"
  no_worker_nodes = true
}



# resource "volterra_tf_params_action" "action1" {
#   site_name       = volterra_aws_vpc_site.example.name
#   site_kind       = "aws_vpc_site"
#   action          = var.xcs_tf_action
#   wait_for_action = true
# }

resource "volterra_tf_params_action" "aws-vpc-site-terraform-params-action" {
  site_name = var.name
  site_kind = "aws_vpc_site"
  action = "apply"
  depends_on = [ volterra_aws_vpc_site.example ]
  wait_for_action = true
}