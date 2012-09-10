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
		notify	=> Service["mysql"],
	}

	service { "mysql":
        enable  => true,
        ensure  => running,
        require => Package["mysql-server"],
  } 	

	exec { "create-openfire-db":
		path    => '/usr/local/bin:/usr/bin:/bin',
		command	=>	"mysql -u root -p $openfirerootpass -e 'create database openfire'",
		unless  => "mysql -u root -p $openfirerootpass -e 'use openfire'",
	}

}
