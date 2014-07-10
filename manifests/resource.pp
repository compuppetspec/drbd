define drbd::resource($resource_config) {
  include drbd::params
  file { "${drbd::params::drbd_config_directory}/${name}.res":
    ensure  => present,
    mode    => '0644',
    content => inline_template($resource_config),
  }
}
