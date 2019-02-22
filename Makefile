WORKSPACE = Canoe.xcworkspace
WORKSPACEDATA = $(WORKSPACE)/contents.xcworkspacedata

.PHONY: all bootstrap dependencies generate frameworks xcodeGenerate clean hooks test

all: generate

bootstrap: dependencies frameworks generate

dependencies:
	bundle install
	brew update
	brew install xcodegen || brew outdated xcodegen || brew upgrade xcodegen
	brew install swiftlint || brew outdated swiftlint || brew upgrade swiftlint
	brew install pmd || brew outdated pmd || brew upgrade pmd

generate: clean
	# Generate R.swift empty files
	mkdir -p "Projects/Application/Sources/Generated"
	touch "Projects/Application/Sources/Generated/R.generated.swift"
	# Generate project files
	for i in Projects/*/project.yml; do \
		xcodegen --spec $$i --project $${i%/*};done
	# Generate workspace
	mkdir -p $(WORKSPACE)
	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $(WORKSPACEDATA)
	echo "<Workspace version = \"1.0\">" >> $(WORKSPACEDATA)
	for i in Projects/*/*.xcodeproj;do \
		echo "<FileRef location = \"group:$$i\"></FileRef>" >> $(WORKSPACEDATA);done
	echo "</Workspace>" >> $(WORKSPACEDATA)

frameworks:
	bundle exec pod install --repo-update
	cp Pods/R.swift/rswift Scripts/
	for i in Rome/*.framework;do echo "- framework: ../../"$$i | sort;done

xcodeGenerate:
	killall Xcode || true && make generate && open $(WORKSPACE)

clean:
	rm -rf Canoe.xcworkspace
	rm -rf Projects/*/*.xcodeproj

hooks:
	./Scripts/Git/Hooks/install.sh

test:
	for i in Projects/*/*.xcodeproj; do \
		set -o pipefail && xcodebuild \
		clean test \
		-workspace Canoe.xcworkspace \
		-scheme $$(basename $$i .xcodeproj) \
		-destination platform\=iOS\ Simulator,OS\=12.1,name\=iPhone\ 8 \
		CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO ONLY_ACTIVE_ARCH=NO \
		| xcpretty; done

