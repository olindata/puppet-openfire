class openfire {

	include openfire::java
	include openfire::config

	package { 'openfire':
		ensure	=> 'installed',
	}

}
