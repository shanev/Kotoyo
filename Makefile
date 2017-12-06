%.swift:
	swift build
release:
	swift build -c release -Xswiftc -static-stdlib
resolve:
	swift package resolve
run: %.swift
	./.build/debug/Kotoyo
debug:
	lldb -- ./.build/debug/Kotoyo
generate:
	swift package generate-xcodeproj
test:
	swift test
clean:
	rm -rf .build
.PHONY: run
