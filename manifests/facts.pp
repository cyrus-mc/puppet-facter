# == Define: facter::facts
#
# Define to handle pushing custom facts to client.
#
# === Parameters
#
# none
#
# === Variables
#
# none
#
# === Examples
#
# class { facter::params: }
#
# === Authors
#
# Matthew Ceroni <matthew.ceroni@8x8.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#
# [ Remember: no empty lines between comments and class definition]
define facter::facts ($key, $value) {

  if (!defined(Class['facter'])) {
    fail('Class facter not defined. You must include facter prior to calling this define')
  }

  # fact variable is an array of structure [ 'Name1:Value1', 'Fact2:Value2', .. ]
  #$fact = split($name, ':')

  # regular expression to check if fact already exists and to replace
  #$match = "^${fact[0]}=\\S*$"
  $match = "^${key}=\\S*$"
  file_line { "fact_line_${key}":
    path    => "${facter::params::facts_d_dir}/facts.txt",
    line    => "${key}=${value}",
    match   => $match,
    require => File["${facter::params::facts_d_dir}/facts.txt"],
  }

}
