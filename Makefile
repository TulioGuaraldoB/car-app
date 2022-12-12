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

mock:
	@echo Generating mocks...
	@echo Mocking repositories...
	@mockgen -source=domain/repository/userRepository.go -destination=domain/repository/mock/mockUserRepository.go -package=mock
	@mockgen -source=domain/repository/carRepository.go -destination=domain/repository/mock/mockCarRepository.go -package=mock
	@echo Mocking applications...
	@mockgen -source=application/userApplication.go -destination=application/mock/mockUserApplication.go -package=mock
	@mockgen -source=application/carApplication.go -destination=application/mock/mockCarApplication.go -package=mock
	@echo Mocking controllers...

test:
	@echo Running tests...
	@go test -v ./...

cover:
	@echo Running test coverage...
	@go test -v ./... -v -coverprofile=coverage/cover.out
	@go tool cover -html=coverage/cover.out -o coverage/cover.html
	@echo Coverage successfully completed.
