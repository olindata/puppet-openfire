class openfire {

	include openfire::params
	include openfire::java
	include openfire::config
	include openfire::installer
	include openfire::mysqlserver

}
