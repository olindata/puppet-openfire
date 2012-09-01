class openfire::config {

	include openfire::user

	file { '/var/lib/openfire':
	  ensure => 'directory',
	  group  => 'openfire',
	  mode   => '750',
	  owner  => 'openfire',
	}

	file { '/etc/openfire/openfire.xml':
		ensure	=> 'present',
		owner	=> 'openfire',
		group	=> 'openfire',
		mode	=> '640',
		content	=> template("openfire/openfire.xml.erb"),
		require	=> Class["openfire::installer"],
	}

	# Had to tweak openfire init script and hence puppet managing it
	file { '/etc/init.d/openfire':
	  ensure  => 'file',
	  group   => 'root',
	  mode    => '755',
	  owner   => 'root',
		source	=>	'puppet:///s_openfire/openfire_init', 
	}
	
}
