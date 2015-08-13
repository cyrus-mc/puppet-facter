# Class: facter::config
#
# This class manages the configuration of facter
#
# Requires: 
#
class facter::config inherits facter::params {

  # validate some of the parameters
  validate_absolute_path($facter::params::facts_d_dir)

  # create necessary facts.d directory (needed due to parent dir existence)
  exec {
    "mkdir-${facter::params::facts_d_dir}":
    command => "mkdir -p ${facter::params::facts_d_dir}",
    unless  => "test -d ${facter::params::facts_d_dir}",
    path    => [ '/bin', '/usr/bin' ];
  } 

  # manage the following files
  file {
    $facter::params::facts_d_dir:
    ensure  => 'directory',
    owner   => 'root',
    group   => 'root',
    mode    => '0755',
    require => Exec[ "mkdir-${facter::params::facts_d_dir}" ];

    "${facter::params::facts_d_dir}/facts.txt":
    ensure  => 'file',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    require => File[ $facter::params::facts_d_dir ];
  }
}
