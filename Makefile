WORKSPACE = Canoe.xcworkspace
WORKSPACEDATA = $(WORKSPACE)/contents.xcworkspacedata

.PHONY: all bootstrap dependencies generate frameworks xcodeGenerate clean hooks test

all: generate

bootstrap: dependencies frameworks generate

dependencies:
	bundle install
	brew install xcodegen || true
	brew install swiftlint || true
	brew install pmd || true

generate: clean
	# Generate R.swift empty files and project files
	for i in Projects/*/project.yml; do \
		mkdir -p "$${i%/*}/Sources/Generated" && \
		touch "$${i%/*}/Sources/Generated/R.generated.swift" && \
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
	xcodebuild -workspace Canoe.xcworkspace -list
ifeq ($(TRAVIS_BRANCH), master)
	$(eval $@_SCHEME := Production)
else
	$(eval $@_SCHEME := Development)
endif
	set -o pipefail && xcodebuild \
	-workspace Canoe.xcworkspace \
	-scheme $($@_SCHEME) \
	-destination platform\=iOS\ Simulator,OS\=12.1,name\=iPhone\ 8 \
	build test | xcpretty

