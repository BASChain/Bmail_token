SHELL=PATH='$(PATH)' /bin/sh

.PHONY: all
all:
	abigen --abi BasStamp.abi --pkg stamp_token --type BasStamp --out BasStamp.go
