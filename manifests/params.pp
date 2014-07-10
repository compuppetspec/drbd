class drbd::params {
  $drbd_package               = 'drbd84-utils'
  $drbd_service               = 'drbd'
  $drbd_kernel_package        = 'kmod-drbd84'
  $drbd_package_ensure        = 'installed'
  $drbd_kernel_package_ensure = 'installed'
  $drbd_service_ensure        = 'running'
  $drbd_service_enable        = true 
  $drbd_config_file           = '/etc/drbd.conf'
  $drbd_config_directory      = '/etc/drbd.d'

  $installed_states = $::osfamily ?{
    default => [
      'absent',
      'installed',
      'latest',
      'present',
    ]
  }
  validate_re($drbd_package_ensure, $installed_states)
  validate_bool($drbd_service_enable)
  validate_string($drbd_package)
  validate_string($drbd_service)
  validate_string($drbd_config_file)
  validate_string($drbd_config_directory)
  case $::osfamily {
    'redhat': {}
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}")
    }
  }
}

