resource "volterra_aws_vpc_site" "example" {
  name       = var.name
  namespace  = "system"
  aws_region = var.region

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

  // One of the arguments from this list "ingress_gw ingress_egress_gw voltstack_cluster" must be set

  voltstack_cluster {
    allowed_vip_port {
      // One of the arguments from this list "use_http_port use_https_port use_http_https_port custom_ports" must be set
      use_http_port = true
    }

    aws_certified_hw = "aws-byol-voltstack-combo"

    az_nodes {
      aws_az_name = var.az
      #aws_az_name = var.az
      disk_size   = "80"

      local_subnet {
        // One of the arguments from this list "subnet_param existing_subnet_id" must be set

        subnet_param {
          ipv4 = "10.0.0.0/21"
          # ipv6 = "1234:568:abcd:9100::/64"
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
  nodes_per_az = "1"
}