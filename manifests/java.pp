class openfire::java {

	package { 'default-jre':
		ensure =>	'installed',
	}

	package { 'sun-java6-jre':
		ensure	=> 'installed',
	}

}
