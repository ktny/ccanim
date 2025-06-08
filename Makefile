# CCAnim Makefile

# バイナリ名
BINARY_NAME=ccanim

# ビルドフラグ
BUILD_FLAGS=-ldflags "-s -w"

# デフォルトターゲット
.PHONY: all
all: build

# ビルド
.PHONY: build
build:
	go build $(BUILD_FLAGS) -o $(BINARY_NAME) .

# 実行
.PHONY: run
run:
	go run .

# クリーンアップ
.PHONY: clean
clean:
	go clean
	rm -f $(BINARY_NAME)

# テスト
.PHONY: test
test:
	go test ./...

# 依存関係の整理
.PHONY: tidy
tidy:
	go mod tidy

# ローカルインストール
.PHONY: install
install:
	go install $(BUILD_FLAGS) .

# すべてのplatform向けビルド
.PHONY: build-all
build-all:
	GOOS=linux GOARCH=amd64 go build $(BUILD_FLAGS) -o $(BINARY_NAME)_linux_amd64 .
	GOOS=darwin GOARCH=amd64 go build $(BUILD_FLAGS) -o $(BINARY_NAME)_darwin_amd64 .
	GOOS=darwin GOARCH=arm64 go build $(BUILD_FLAGS) -o $(BINARY_NAME)_darwin_arm64 .
	GOOS=windows GOARCH=amd64 go build $(BUILD_FLAGS) -o $(BINARY_NAME)_windows_amd64.exe .