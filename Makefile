WORKSPACE = Canoe.xcworkspace
WORKSPACEDATA = $(WORKSPACE)/contents.xcworkspacedata

.PHONY: all bootstrap dependencies generate frameworks xcodeGenerate

all: generate

bootstrap: dependencies frameworks generate

dependencies:
	bundle install
	brew install xcodegen || true
	brew install swiftlint || true

generate:
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
	make clean
	killall Xcode || true && make generate && open $(WORKSPACE)

clean:
	rm -rf Canoe.xcworkspace
	find Projects -name "*.xcodeproj" -delete
