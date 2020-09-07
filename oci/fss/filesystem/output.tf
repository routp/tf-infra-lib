output "file_systems_output" {
  value = oci_file_storage_file_system.oci_file_systems
}

output "mount_targets_output" {
  value = oci_file_storage_mount_target.oci_mount_targets
}

output "export_sets_output" {
  value = oci_file_storage_export_set.oci_export_sets
}

output "export_paths_output" {
  value = oci_file_storage_export.oci_export_paths
}