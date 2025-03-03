.ONESHELL:

build-arch:
	./webui/build.sh
	dotnet publish -c Release -r linux-x64 BililiveRecorder.Cli/BililiveRecorder.Cli.csproj

install:
	mkdir -p $(DESTDIR)/opt/bililive-recorder
	cp -r $(CURDIR)/BililiveRecorder.Cli/publish/linux-x64/Release/* $(DESTDIR)/opt/bililive-recorder

.PHONY: install build-arch