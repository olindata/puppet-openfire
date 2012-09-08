class openfire::mysqlserver {

	package { "mysql-server":
						ensure	=> installed,
	}

}
