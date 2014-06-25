.PHONY: out install

out:
	@echo "Use 'make install' to install."

install:

	cp -f ./manage-interfaces /usr/local/sbin/manage-interfaces
	chmod 0755 /usr/local/sbin/manage-interfaces
