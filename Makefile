.ONESHELL:

build-arch:
	git submodule update --init --recursive
	./webui/build.sh
	dotnet publish -c Release -r linux-x64 BililiveRecorder.Cli/BililiveRecorder.Cli.csproj

install:
	mkdir -p $(DESTDIR)/usr/lib/bililive-recorder
	cp -r $(CURDIR)/BililiveRecorder.Cli/publish/linux-x64/Release/* $(DESTDIR)/usr/lib/bililive-recorder
	chmod -x $(DESTDIR)/usr/lib/bililive-recorder/*
	chmod +x $(DESTDIR)/usr/lib/bililive-recorder/BililiveRecorder.Cli

.PHONY: install build-arch