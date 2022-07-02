AWS_DEFAULT_REGION := ap-northeast-1
AWS_PROFILE        := tetsu-varmos-admin

.PHONY: all

all:
	@more Makefile

scopes := isucon11-qualify \

list-scopes:
	find * -mindepth 1 -type f -name "*.tf" | xargs -I {} dirname {} | egrep -v '(.terraform|vendor)' | sort | uniq

.PHONY: $(scopes)
terraform/init: terraform_remote_s3_bucket = isucon-provisioning
terraform/init: terraform_remote_s3_key    = $(shell echo "$@" | sed -e 's/\(\/\)*$$//g')/terraform.tfstate
$(scopes): global.hcl
	cp -f auto_global_variables.tf $@
	docker run --rm -it \
		-v ~/.aws:/root/.aws \
		-e AWS_PROFILE=$(AWS_PROFILE) \
		-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
		-v $(CURDIR):/app \
		-w /app/$@ \
		hashicorp/terraform init \
			-get=true \
			-get-plugins=true \
			-backend=true \
			-backend-config="bucket=isucon-provisioning" \
			-backend-config="key=$(shell echo "$@" | sed -e 's/\(\/\)*$$//g')/terraform.tfstate" \
			-backend-config="region=$(AWS_DEFAULT_REGION)" \
			-backend-config="profile=$(AWS_PROFILE)"
	docker run --rm -it \
		-v ~/.aws:/root/.aws \
		-e AWS_PROFILE=$(AWS_PROFILE) \
		-e AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
		-e TF_VAR_AWS_PROFILE=$(AWS_PROFILE) \
		-e TF_VAR_AWS_DEFAULT_REGION=$(AWS_DEFAULT_REGION) \
		-v $(CURDIR):/app \
		-w /app/$@ \
		hashicorp/terraform apply -auto-approve=false -var-file=/app/$<

global.hcl: ../global.hcl
	cp -f $< $@
