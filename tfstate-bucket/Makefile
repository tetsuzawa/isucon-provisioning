AWS_PROFILE        := tetsu-varmos-admin
AWS_DEFAULT_REGION := ap-northeast-1
DOCKER_TERRAFORM = docker-compose run --rm \
	-e AWS_PROFILE=$(AWS_PROFILE) \
	-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
	terraform

.PHONY: all plan apply init fmt
all:
	@more Makefile

init:
	$(DOCKER_TERRAFORM) init \
		-upgrade \
		-get=true

plan: init fmt
	$(DOCKER_TERRAFORM) plan -parallelism=1000

apply: init
	$(DOCKER_TERRAFORM) apply -auto-approve=false -parallelism=1000

destroy: init
	$(DOCKER_TERRAFORM) destroy -auto-approve=false -parallelism=1000 $(ARG)

fmt:
	$(DOCKER_TERRAFORM) fmt
