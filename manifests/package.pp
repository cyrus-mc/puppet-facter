# Class: facter::package
#
# This class manages the facter package installation
#
# Requires:
#
class facter::package (
  $ensure = $facter::params::package_ensure
  ) inherits facter::params {

  # validate parameters
  if !is_string($facter::params::package) {
    fail('facter::params::package must be a string or an array of package(s) to install')
  }

  # install necessary package(s)
  package { $facter::params::package:
    ensure => $ensure,
  }
}
