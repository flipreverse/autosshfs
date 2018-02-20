SUBDIRS = src

PREFIX = /usr/local

all:
	@echo
	@echo autosshfs is based on the article and code at
	@echo http://pturing.firehead.org/software/autofs_sshfs/
	@echo
	@echo License: see COPYING file, or make license
	@echo
	@echo sudo make [un]install  -- Install or uninstall autosshfs
	@echo

install:
	@cd src && make
	@install -o root -g root     -m 0755 src/autosshfs-user ${PREFIX}/bin/
	@install -o root -g root -m 0755 src/autosshfs-map  ${PREFIX}/bin/
	@install -o root -g root -m 0755 src/autosshfs-ssh  ${PREFIX}/bin/
	@install -o root -g root     -m 0755 bin/keychain-ring  ${PREFIX}/bin/
	@install -o root -g root     -m 0755 -d ${PREFIX}/share/doc/autosshfs/
	@install -o root -g root     -m 0644 doc/* ${PREFIX}/share/doc/autosshfs

uninstall:
	@rm -f ${PREFIX}/bin/autosshfs-* ${PREFIX}/bin/keychain-ring
	@rm -f ${PREFIX}/share/doc/autosshfs/*
	@rmdir ${PREFIX}/share/doc/autosshfs
	@cd src && make clean

license:
	@rm -f COPYING
	@wget -q -OCOPYING http://www.gnu.org/licenses/agpl.txt
