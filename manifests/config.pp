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

}
