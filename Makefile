.ONESHELL:

build-arch:
	git submodule update --init --recursive
	./webui/build.sh
	dotnet publish -c Release -r linux-x64 BililiveRecorder.Cli/BililiveRecorder.Cli.csproj

install:
	mkdir -p $(DESTDIR)/usr/lib/brec
	cp -r $(CURDIR)/BililiveRecorder.Cli/publish/linux-x64/Release/* $(DESTDIR)/usr/lib/brec
	chmod -x $(DESTDIR)/usr/lib/brec/*
	chmod +x $(DESTDIR)/usr/lib/brec/BililiveRecorder.Cli

.PHONY: install build-arch