/*variable "fss_ad" {type = string}
variable "compartment_id" {type = string}
variable "fss_display_name" {type = string}
variable "tags" {type = map(string)}
variable "create_fss" {type = bool, default = true}

variable "mnt_subnet_id" {type = string}
variable "mnt_display_name" {type = string}

variable "export_set_display_name" {type = string}

variable "max_fs_stat_bytes" {type = number}
variable "max_fs_stat_files" {type = number}

variable "fss_export_path" {type = string}
variable "fss_export_source_ip_cidr" {type = string, default = "0.0.0.0/0"}
variable "fss_export_access_type" {type = string, default = "READ_WRITE"}
variable "fss_export_anonymous_gid" {type = number, default = 65534}
variable "fss_export_anonymous_uid" {type = number, default = 65534}
variable "fss_export_identity_squash" {type = string, default = "ROOT"}
variable "fss_export_require_privileged_source_port" {type = bool, default = false}*/

variable "file_systems" {
  description = "list of file systems"
}

variable "mount_targets" {
  description = "list of file mount targets"
}
variable "export_sets" {
  description = "list of file export sets"
}
variable "export_paths" {
  description = "list of export paths"
}


