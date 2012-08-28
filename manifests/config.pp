class openfire::config {

	include openfire::user

	file { '/var/lib/openfire':
	  ensure => 'directory',
	  group  => 'openfire',
	  mode   => '750',
	  owner  => 'openfire',
	  type   => 'directory',
	}

}
