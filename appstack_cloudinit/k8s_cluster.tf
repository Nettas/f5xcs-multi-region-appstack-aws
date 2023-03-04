# ### k8s cluster ###
resource "volterra_k8s_cluster" "aws_sse" {
  name      = var.clustername
  namespace = "system"

  // One of the arguments from this list "no_cluster_wide_apps cluster_wide_app_list" must be set
  no_cluster_wide_apps = true

  // One of the arguments from this list "use_custom_cluster_role_bindings use_default_cluster_role_bindings" must be set
  use_default_cluster_role_bindings = true

  // One of the arguments from this list "use_default_cluster_roles use_custom_cluster_role_list" must be set
  use_default_cluster_roles = true

  // One of the arguments from this list "cluster_scoped_access_deny cluster_scoped_access_permit" must be set
  cluster_scoped_access_deny = false

  // One of the arguments from this list "no_global_access global_access_enable" must be set
  no_global_access = false

  // One of the arguments from this list "no_insecure_registries insecure_registry_list" must be set

#   insecure_registry_list {
#     insecure_registries = ["example.com:5000"]
#   }
  // One of the arguments from this list "no_local_access local_access_config" must be set
  no_local_access = true
  // One of the arguments from this list "use_default_psp use_custom_psp_list" must be set
  use_default_psp = true
}