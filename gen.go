package gen

//go:generate go run ./cmd/tools/terndotenv/main.go
//go:generate docker run --rm -v ${PWD}:/src -w /src sqlc/sqlc generate -f ./internal/store/pgstore/sqlc.yaml
