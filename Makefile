run:
	@echo Running...
	@go run main.go

install:
	@echo Downloading dependencies...
	@go get
	@echo Validating dependencies...
	@go mod tidy

vendor:
	@echo Generating vendor from dependencies...
	@go mod vendor

test:
	@echo Running tests...
	@go test -v ./...

cover:
	@echo Running test coverage...
	@go test -v ./... -v -coverprofile=coverage/cover.out
	@go tool cover -html=coverage/cover.out -o coverage/cover.html
	@echo Coverage successfully completed.