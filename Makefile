
REGISTRY=registry.inventec
ANDONPKG=andon
VERSIONTAG=1.0

PACKAGE_OFFLINE_PARA=$(ANDONPKG)/$(ANDONPKG).$(VERSIONTAG).tar.gz \
					$(ANDONPKG)/install.sh \
					$(ANDONPKG)/common.sh \
					$(ANDONPKG)/docker-compose.yml

package_offline:

	@echo "packing offline package ..."
	@cp -r make $(ANDONPKG)

	@echo "saving andon docker image"
	@docker-compose -f make/docker-compose.yml pull
	@docker save $(shell grep 'image:' make/docker-compose.yml | cut -d ":" -f 2 | tr "\n" " ") \
	| gzip > $(ANDONPKG)/$(ANDONPKG).$(VERSIONTAG).tar.gz

	# @tar -zcvf $(ANDONPKG)-offline-installer-$(VERSIONTAG).tgz $(PACKAGE_OFFLINE_PARA)
	# @rm -rf $(ANDONPKG)
	@echo "Done."

build:
	make package_offline