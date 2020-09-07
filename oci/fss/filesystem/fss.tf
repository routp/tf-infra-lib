# OCI File System Storage

resource "oci_file_storage_file_system" "oci_file_systems" {
  count = length(var.file_systems)
  availability_domain = var.file_systems[count.index].availability_domain
  compartment_id = var.file_systems[count.index].compartment_id

  #Optional
  display_name = lookup(var.file_systems[count.index], "display_name", null)
  defined_tags = lookup(var.file_systems[count.index], "defined_tags", null)
  freeform_tags = lookup(var.file_systems[count.index], "freeform_tags", null)
  kms_key_id = lookup(var.file_systems[count.index], "kms_key_id", null)
}


resource "oci_file_storage_mount_target" "oci_mount_targets" {
  count = length(var.mount_targets)
  availability_domain = var.mount_targets[count.index].availability_domain
  compartment_id = var.mount_targets[count.index].compartment_id
  subnet_id = var.mount_targets[count.index].subnet_id

  #Optional
  display_name = lookup(var.mount_targets[count.index], "display_name", null)
  defined_tags = lookup(var.mount_targets[count.index], "defined_tags", null)
  freeform_tags = lookup(var.mount_targets[count.index], "freeform_tags", null)
  hostname_label = lookup(var.mount_targets[count.index], "hostname_label", null)
  ip_address = lookup(var.mount_targets[count.index], "ip_address", null)
  nsg_ids = lookup(var.mount_targets[count.index], "nsg_ids", null)
}

resource "oci_file_storage_export_set" "oci_export_sets" {
  count = length(var.export_sets)
  mount_target_id = oci_file_storage_mount_target.oci_mount_targets[count.index].id

  #Optional
  display_name = lookup(var.export_sets[count.index], "display_name", null)
  max_fs_stat_bytes = lookup(var.export_sets[count.index], "max_fs_stat_bytes", null)
  max_fs_stat_files = lookup(var.export_sets[count.index], "max_fs_stat_files", null)
}

resource "oci_file_storage_export" "oci_export_paths" {
  count = length(var.export_paths)
  export_set_id = oci_file_storage_export_set.oci_export_sets[count.index].id
  file_system_id = oci_file_storage_file_system.oci_file_systems[count.index].id
  path = var.export_paths[count.index].fss_export_path

  #Optional
  export_options {
    source = lookup(var.export_sets[count.index], "source", null)
    access = lookup(var.export_sets[count.index], "access", null)
    anonymous_gid = lookup(var.export_sets[count.index], "anonymous_gid", null)
    anonymous_uid = lookup(var.export_sets[count.index], "anonymous_uid", null)
    identity_squash = lookup(var.export_sets[count.index], "identity_squash", null)
    require_privileged_source_port = lookup(var.export_sets[count.index], "require_privileged_source_port", null)
  }
}



