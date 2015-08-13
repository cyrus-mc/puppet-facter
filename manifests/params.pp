# Class: facter::params
#
# This class provides default parameters for the facter module
#
# Requires:
#
class facter::params {

  # non-OS specific default parameters
  $package_ensure  = hiera('facter::package_ensure', 'present')

  case $::osfamily {
    'RedHat': {
      $package     = hiera('facter::package', 'facter')
      $facts_d_dir   = hiera('facter::facts_d_dir', '/etc/facter/facts.d')
    }

    default: {
      fail("${module_name} : unsupported OS family ${::osfamily}")
    }
  }

}
