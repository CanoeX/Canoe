WORKSPACE = Canoe.xcworkspace
WORKSPACEDATA = $(WORKSPACE)/contents.xcworkspacedata
WORKSPACESHAREDDATA = $(WORKSPACE)/xcshareddata
WORKSPACESHAREDDATASETTINGS = $(WORKSPACESHAREDDATA)/WorkspaceSettings.xcsettings

.PHONY: all bootstrap dependencies generate frameworks xcodeGenerate clean hooks

all: generate

bootstrap: dependencies frameworks generate

dependencies:
	bundle install
	brew install xcodegen || true
	brew install swiftlint || true

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
	# Set legacy build system type
	mkdir -p $(WORKSPACESHAREDDATA)
	echo "<?xml version=\"1.0\" encoding=\"UTF-8\"?>" > $(WORKSPACESHAREDDATASETTINGS)
	echo "<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "<plist version=\"1.0\">" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "<dict>" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "<key>BuildSystemType</key>" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "<string>Original</string>" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "</dict>" >> $(WORKSPACESHAREDDATASETTINGS)
	echo "</plist>" >> $(WORKSPACESHAREDDATASETTINGS)

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
ifeq ($(TRAVIS_BRANCH), "MASTER")
	set -o pipefail && xcodebuild \
	-workspace Canoe.xcworkspace \
	-scheme Production \
	-destination platform\=iOS\ Simulator,OS\=12.1,name\=iPhone\ 8 \
	build test | xcpretty
else
	set -o pipefail && xcodebuild \
	-workspace Canoe.xcworkspace \
	-scheme Development \
	-destination platform\=iOS\ Simulator,OS\=12.1,name\=iPhone\ 8 \
	build test | xcpretty
endif
