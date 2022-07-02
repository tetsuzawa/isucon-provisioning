.PHONY: read_the_makefile_ruke
.DEFAULT_GOAL := read_the_makefile_ruke
read_the_makefile_ruke:
	@more Makefile

AWS_DEFAULT_REGION := ap-northeast-1
AWS_PROFILE        := tetsu-varmos-admin

OK := \033[32mok\033[0m

TERRAFORM = docker-compose run --rm terraform
TERRAFORM_SHELL = docker-compose run --rm --entrypoint /bin/ash terraform
terraform_remote_s3_bucket = isucon-provisioning
terraform_remote_s3_key    = $(shell echo "$(SCOPE)" | sed -e 's/\(\/\)*$$//g')/terraform.tfstate

# terraformのapply対象とするscope
# e.g. make terraform/apply SCOPE=bqloader-batch
SCOPE :=
scope_dirs := $(shell find * -mindepth 1 -type f -name '_tf_config.tf' | egrep -v '(.terraform|vendor)' | xargs -I {} dirname {} | sort | uniq)

TARGET :=

## Bootstrap
.PHONY: plan_all $(scope_dirs) plan apply test lint* __require_scope_val tfstatediff clean

plan: terraform/plan
apply: terraform/apply
apply/target: terraform/apply/target
destroy: terraform/destroy
test: lint
lint: lint/json terraform/validate
lint/json:
ifneq ("$(shell which jq)","")
	@printf "\n\033[34m[%s]\033[0m\n\n" "Checking validation format of json files"
	@for json_file in $(shell git ls-files | grep -v '\.tpl' | grep .json); do \
		printf "%-60s ... " $$json_file; \
		$(shell which jq) . $$json_file 1>/dev/null && echo "$(OK)" || IF_ERROR=1; \
	done; exit $$IF_ERROR
endif
# 直近2versionのtfstateのdiffを出力する
tfstatediff: __require_scope_val
	mkdir -p .tmp
	@# diffのexit codeは無視
	-vendor/bin/s3diff $(AWS_PROFILE) $(terraform_remote_s3_bucket) $(terraform_remote_s3_key) .tmp || true
clean:
	-rm -rf .tmp


## Terraform
.PHONY: terraform/*
terraform/validate:
	@printf "\n\033[34m[%s]\033[0m\n\n" "Checking validation for terraform directories"
	@for tf_dir in $(terraform_dirs); do \
	  printf "%-60s ... " "$$tf_dir"; \
	  $(TERRAFORM) $(@F) -check-variables=false $$tf_dir && echo "$(OK)" || IF_ERROR=1; \
	done; exit $$IF_ERROR

terraform/info:
	@echo "terraform_var_dirs = $(terraform_dirs)"

__require_scope_val:
ifeq ($(SCOPE),)
	$(error "U should define SCOPE #=> Like $$ make SCOPE=bqloader-batch")
endif

terraform/init: __require_scope_val
	 $(TERRAFORM) init \
		-upgrade \
		-reconfigure \
		-get=true \
		-backend=true \
		-backend-config="bucket=$(terraform_remote_s3_bucket)" \
		-backend-config="key=$(terraform_remote_s3_key)" \
		-backend-config="region=$(AWS_DEFAULT_REGION)" \
		-backend-config="profile=$(AWS_PROFILE)"

terraform/plan: terraform/init terraform/fmt
	$(TERRAFORM) plan -parallelism=1000

terraform/apply: terraform/init terraform/fmt
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000

terraform/apply/target: terraform/init terraform/fmt
	$(TERRAFORM) apply -auto-approve=false -parallelism=1000 --target=$(TARGET)

terraform/destroy: terraform/init terraform/fmt
	$(TERRAFORM) apply -destroy -auto-approve=false -parallelism=1000

terraform/shell: terraform/init
	$(TERRAFORM_SHELL)

terraform/fmt:
	$(TERRAFORM) fmt

# terraform version up 時の便利ターゲット
# diff がある SCOPE があれば exit 1 で終了 ( make 自体は exit 2
tmp_result.txt:
	touch $@
show_scope_list_with_diff: tmp_result.txt
	@$(MAKE) $(addprefix show_scope_list_with_diff/,$(scope_dirs)) | tee tmp_result.txt
show_scope_list_with_diff/%:
	@$(MAKE) terraform/init SCOPE=$* > /dev/null
	@env SCOPE=$* $(TERRAFORM_SHELL) -c "terraform fmt > /dev/null && terraform plan | grep -q -e 'No changes.' -e '0 to add, 0 to change, 0 to destroy.' || echo $* has Changes."

# version up時などに単発でrefresh_onlyを叩きたい時に使う
terraform/refresh_only: terraform/init terraform/fmt
	$(TERRAFORM) apply -refresh-only -auto-approve=false -parallelism=1000

# 差分がない SCOPE を全て apply -refresh_onlyする君
apply_scope_with_no_diff:
	for scope in $(scope_dirs) ; do\
		$(MAKE) terraform/init SCOPE=$$scope; \
		env SCOPE=$$scope $(TERRAFORM_SHELL) -c "terraform fmt && terraform plan | grep -q -e 'No changes.' -e '0 to add, 0 to change, 0 to destroy.' && terraform apply -refresh-only -auto-approve=false || echo $$scope has Changes."; \
	done
