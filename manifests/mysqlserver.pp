class openfire::mysqlserver {

	package { "mysql-server":
						ensure	=> installed,
	}

	file { "/etc/mysql/my.cnf":
	  ensure  => 'file',
	  group   => 'root',
	  mode    => '644',
	  owner   => 'root',
		source	=> 'puppet:///openfire/my.cnf',
		require	=> Package["mysql-server"],
		notify	=> Service["mysqld"],
	}

	service { "mysqld":
        enable  => true,
        ensure  => running,
        require => Package["mysql-server"],
  } 	

}
