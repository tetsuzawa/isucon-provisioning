TERRAFORM := terraform

.PHONY: all plan apply init fmt
all:
	@more Makefile

init:
	$(TERRAFORM) init \
		-upgrade \
		-get=true

plan: init fmt
	$(TERRAFORM) plan -parallelism=1000

apply: init
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000

destroy: init
	$(TERRAFORM) destroy -auto-approve=false -parallelism=1000 $(ARG)

fmt:
	$(TERRAFORM) fmt
