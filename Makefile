GREEN  := $(shell tput -Txterm setaf 2)
NC     := $(shell tput -Txterm sgr0)

help: ## Print this help message
	@awk -F ':|##' '/^[^\t].+?:.*?##/ { printf "${GREEN}%-20s${NC}%s\n", $$1, $$NF }' $(MAKEFILE_LIST)

BUILD_DIR=build
BUCKET_NAME=www.grocky.com

.PHONY=publish
publish: build ## Publish the application to S3
	aws s3 sync --cache-control 'max-age=604800' --exclude index.html build/ s3://$(BUCKET_NAME)
	aws s3 sync --cache-control 'no-cache' $(BUILD_DIR)/ s3://$(BUCKET_NAME)

init: ## intitalize the repo
	@cp .git-hooks/pre-commit .git/hooks && echo "${GREEN}initialized git hooks${NC}"

## Infrastructure
infra-init: ## Initialize infrastructure
	cd infrastructure; terraform init

infra-plan: ## See terraform plan
	cd infrastructure; terraform plan

infra-apply: ## Apply terraform
	cd infrastructure; terraform apply

.SECONDEXPANSION:
%/graph.dot: %/*.tf
	cd $(shell dirname $@); \
	terraform graph > $(shell basename $@);

%/graph.svg: %/graph.dot
	dot -Tsvg $< -o $@
