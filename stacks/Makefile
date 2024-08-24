export TF_PLUGIN_CACHE_DIR := $(HOME)/.terraform.d/plugin-cache

TERRAFORM := terraform -chdir=$(SCOPE)

# (optional) 利用可能な鍵を登録することでデバッグするときにsshできる
KEY_NAME :=


.PHONY: all plan apply init workspace import mv fmt_r
all:
	@more Makefile

init: __require_scope
	$(TERRAFORM) init \
		-upgrade \
		-get=true

plan: KEY_NAME_VAR := -var key_name=$(KEY_NAME)
plan: init fmt
	$(TERRAFORM) plan $(KEY_NAME_VAR) -parallelism=1000

show: init
	$(TERRAFORM) show

rm: init
	$(TERRAFORM) state rm $(ARG)

plan_target: target_resource:=
plan_target: init
	$(TERRAFORM) plan -target=$(target)

apply: KEY_NAME_VAR := -var key_name=$(KEY_NAME)
apply: init fmt
	$(TERRAFORM) apply $(KEY_NAME_VAR) -auto-approve=false -parallelism=1000

apply_target: target:=
apply_target: KEY_NAME_VAR := -var key_name=$(KEY_NAME)
apply_target: init fmt
	$(TERRAFORM) apply $(KEY_NAME_VAR) -auto-approve=false -parallelism=1000 -target=$(target)

destroy: KEY_NAME_VAR := -var key_name=$(KEY_NAME)
destroy: init
	$(TERRAFORM) destroy $(KEY_NAME_VAR) -auto-approve=false -parallelism=1000 $(ARG)

fmt: __require_scope
	$(TERRAFORM) fmt

__require_scope:
ifeq ($(SCOPE),)
	$(error "You must specify SCOPE #=> Like $$ make SCOPE=hello-user2/user-name xxx")
endif
