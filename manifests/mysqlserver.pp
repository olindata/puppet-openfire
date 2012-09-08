class openfire::mysql::server {

	package { "mysql-server":
						ensure	=> installed,
	}

}
