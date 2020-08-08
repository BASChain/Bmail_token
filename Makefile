SHELL=PATH='$(PATH)' /bin/sh

.PHONY: all
all:
	abigen --abi BasStamp.abi --pkg generated --type BasStamp --out BasStamp.go
