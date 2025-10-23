EXTRA_DIST = utils.sh

dist-hook:
	chmod +x ./"$(srcdir)"/bootstrap-tarballs.sh
	./"$(srcdir)"/bootstrap-tarballs.sh "@CORE_DIRECTORY@" "@MASTERFILES_DIRECTORY@" "@ENTERPRISE_DIRECTORY@" "@NOVA_DIRECTORY@" "@MISSION_PORTAL_DIRECTORY@"
