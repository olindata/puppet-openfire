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


	# Set MySQL root pass for the first time
	#
	exec { "set-mysql-root":
		path	=>	'/usr/local/bin:/usr/bin:/bin',
		refreshonly	=> true,
		command	=> "mysqladmin -u root password $openfire::params::openfirerootpass",
		unless	=> "mysqladmin -uroot -p$openfire::params::openfirerootpassword status",
		subscribe	=> Package["mysql-server"],	
	}

	# Create Database for openfire
	#
	exec { "create-openfire-db":
		path    => '/usr/local/bin:/usr/bin:/bin',
		command	=>	"mysql -u root -p$openfire::params::openfirerootpass -e 'create database openfire'",
		unless  => "mysql -u root -p$openfire::params::openfirerootpass -e 'use openfire'",
		require => Exec["set-mysql-root"],
	}

	# Import vanilla db structure content into openfire database
	#
	exec { "create-openfire-db-content":
		path    => '/usr/local/bin:/usr/bin:/bin',
		command	=>	"mysql -u root -p$openfire::params::openfirerootpass openfire < /etc/openfire/openfiredb_vanilla.sql",
		unless  => "mysql -u root -p$openfire::params::openfirerootpass -e 'use openfire'",
		onlyif =>	"test -e /etc/openfire/openfiredb_vanilla.sql",
		require => [ File["/etc/openfire/openfiredb_vanilla.sql"], Exec["create-openfire-db"] ],
	}

	# Create admin user for openfire 
	#
	exec { "create-openfire-admin":
		path    => '/usr/local/bin:/usr/bin:/bin',
		command	=>	"mysql -u root -p$openfire::params::openfirerootpass -e 'create user \'$openfire::params::openfireadmin\'@\'localhost\' identified by \'$openfire::params::openfireadminpass\''",
		unless  => "mysql -u $openfire::params::openfireadmin -p$openfire::params::openfireadminpass -e 'status'",
		require => Exec["create-openfire-db"],
	}


	# Create rights for admin user of openfire 
	#
	exec { "create-openfire-rights":
		path    => '/usr/local/bin:/usr/bin:/bin',
		command	=>	"mysql -u root -p$openfire::params::openfirerootpass -e 'grant all privileges on openfire.\* to \'$openfire::params::openfireadmin\'@\'localhost\' identified by \'$openfire::params::openfireadminpass\''",
		unless  => "mysql -u $openfire::params::openfireadmin -p$openfire::params::openfireadminpass -e 'use openfire'",
		require => Exec["create-openfire-admin"],
		notify => Service["openfire"],
	}

}
