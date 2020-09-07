variable "fss_snapshots" {}

resource "oci_file_storage_snapshot" "oci_fss_snapshots" {
  count = length(var.fss_snapshots)
  file_system_id = var.fss_snapshots[count.index].file_system_id
  name = var.fss_snapshots[count.index].name

  #Optional
  defined_tags = lookup(var.fss_snapshots[count.index], "defined_tags", null)
  freeform_tags = lookup(var.fss_snapshots[count.index], "freeform_tags", null)
}

output "fss_snapshots_ouput" {
  value = oci_file_storage_snapshot.oci_fss_snapshots
}

terraform {
  required_version = ">= 0.12"
}