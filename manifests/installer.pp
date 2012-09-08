class openfire::installer {

 package { "openfire":
    ensure  => 'installed',
  }

 service { "openfire":
        enable  => true,
        require => Package["openfire"], 
        ensure => running,
 } 

}
