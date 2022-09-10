AWS_PROFILE        := tetsu-varmos-admin
AWS_DEFAULT_REGION := ap-northeast-1
TFSTATE_BUCKET := isucon-provisioning-tfstate
TFSTATE_KEY = $(SCOPE)/terraform.tfstate
DOCKER_TERRAFORM = docker-compose run --rm \
	-e AWS_PROFILE=$(AWS_PROFILE) \
	-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
	-e SCOPE=$(SCOPE) \
	-e TF_VAR_state_bucket=$(TFSTATE_BUCKET) \
	terraform

.PHONY: all plan apply init workspace import mv fmt_r
all:
	@more Makefile

init: __require_scope
	$(DOCKER_TERRAFORM) init \
		-upgrade \
		-get=true \
		-backend=true \
		-backend-config="region=$(AWS_DEFAULT_REGION)" \
		-backend-config="profile=$(AWS_PROFILE)" \
		-backend-config="bucket=$(TFSTATE_BUCKET)" \
		-backend-config="key=$(TFSTATE_KEY)"

plan: init fmt
	$(DOCKER_TERRAFORM) plan -parallelism=1000

show: init
	$(DOCKER_TERRAFORM) show

rm: init
	$(DOCKER_TERRAFORM) state rm $(ARG)

target_resource:=
plan_target: init
	$(DOCKER_TERRAFORM) plan -target=$(target_resource)

apply: init fmt
	$(DOCKER_TERRAFORM) apply -auto-approve=false -parallelism=1000

destroy: init
	$(DOCKER_TERRAFORM) destroy -auto-approve=false -parallelism=1000 $(ARG)

fmt: __require_scope
	$(DOCKER_TERRAFORM) fmt

__require_scope:
ifeq ($(SCOPE),)
	$(error "You must specify SCOPE #=> Like $$ make SCOPE=hello-user2/user-name xxx")
endif
