SHELL=PATH='$(PATH)' /bin/sh

.PHONY: all
all:
	abigen --abi BasStamp.abi --pkg stamp --type BasStamp --out BasStamp.go
