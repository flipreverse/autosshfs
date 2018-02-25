PREFIX  = /usr/local
RESTART = $(shell $(CURDIR)/../bin/which_restart)

SCRIPTS = autosshfs-map autosshfs-ssh autosshfs-user autosshfs-utils

mkscript = sed \
	-e "s|%PREFIX%|$(PREFIX)|" \
	-e "s|%RESTART%|$(RESTART)|" \
	$1.in

autosshfs-%: autosshfs-%.in
	$(call mkscript,$@) > $@

all: ${SCRIPTS}

clean:
	@rm ${SCRIPTS}
