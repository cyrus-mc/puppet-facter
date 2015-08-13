# == Class: facter
#
# This class is the main entry point for the module facter
#
# Requires:
#
class facter (
  $package_ensure = $mcollective::params::package_ensure
  ) inherits facter::params {

  # call sub classes
  class {
    'facter::package':
    ensure   => $package_ensure;

    'facter::config':
  }
}
