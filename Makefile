SHELL=PATH='$(PATH)' /bin/sh

.PHONY: all
all:
	abigen --abi StampManager.abi --pkg generated --type StampManager --out StampManager.go
	abigen --abi BMailToken.abi --pkg generated --type Token --out BMailToken.go
	abigen --abi FreeTrial.abi --pkg generated --type FreeTrial --out FreeTrial.go
