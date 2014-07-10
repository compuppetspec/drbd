class drbd (
  $drbd_package               = $drbd::params::drbd_package,
  $drbd_service               = $drbd::params::drbd_service,
  $drbd_kernel_package        = $drbd::params::drbd_kernel_package,
  $drbd_package_ensure        = $drbd::params::drbd_package_ensure,
  $drbd_kernel_package_ensure = $drbd::params::drbd_kernel_package_ensure,
  $drbd_service_ensure        = $drbd::params::drbd_service_ensure,
  $drbd_service_enable        = $drbd::params::drbd_service_enable,
  $drbd_config_file           = $drbd::params::drbd_config_file,
  $drbd_config_directory      = $drbd::params::drbd_config_directory
) inherits drbd::params {
  package{ $drbd_kernel_package:
    ensure => $drbd::params::drbd_kernel_package_ensure,
  }->
  package{ $drbd_package:
    ensure => $drbd::params::drbd_package_ensure,
  }->
  service { $drbd_service:
    ensure => $drbd_service_ensure,
    enable => $drbd_service_enable,
  }
}
