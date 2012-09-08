class openfire::params {

	# Define your variables in your global site.pp and keep it private

	$openfirerootpass	=	$::openfire_root_pass ? {
		''	=> FALSE,
		default	=>	$::openfire_root_pass,
	}

	$openfireadmin	= $::openfire_admin ? {
		''	=> openfireadmin,
		default	=> $::openfire_admin,
	}

	$openfireadminpass	=	$::openfire_admin_pass ? {
		''	=> FALSE,
		default	=>	$::openfire_admin_pass,
	}

}	