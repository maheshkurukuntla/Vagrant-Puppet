# == Class: http
#
# Full description of class http here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'http':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2015 Your name here, unless otherwise noted.
#

class http (
	
	$config_dir = $http::params::config_dir,
	$config_file = $http::params::config_file,
	$package  = $http::params::package,
  	$service  = $http::params::service,
	$data_location = $http::params::data_location
	
	) inherits http::params {
	package { $http::package :
		ensure =>installed,
	}
	file { "$data_location/index.html" :
		ensure => file, 
		source => "puppet:///modules/http/index.html",
		require => Package["$http::package"],
        }
	service { $http::service :
		ensure => running,
		require => Package["$http::package"],
	}
}
		
