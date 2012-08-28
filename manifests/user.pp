class openfire::user {

	user { 'openfire':
	  ensure           => 'present',
	  comment          => 'Openfire XMPP server,,,',
	  home             => '/var/lib/openfire',
	  password         => '*',
	  password_max_age => '99999',
	  password_min_age => '0',
	  shell            => '/bin/false',
	}

	group { 'openfire':
	  ensure => 'present',
	}

}
