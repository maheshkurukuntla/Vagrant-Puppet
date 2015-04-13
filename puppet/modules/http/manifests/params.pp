class http::params {
	case $::osfamily {
	'RedHat': {
		$package_modssl = 'mod_ssl'
		$package = 'httpd'
		$service = 'httpd'
		$config_dir = '/etc/httpd'
		$config_file = '/etc/httpd/conf/httpd.conf'
		$data_location = '/var/www/html'
	}
	
}
}

