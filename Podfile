source "https://github.com/CocoaPods/Specs.git"
platform :ios, "9.0"

plugin "cocoapods-rome", {
         :pre_compile => Proc.new { |installer|
           installer.pods_project.targets.each do |target|
             target.build_configurations.each do |config|
               config.build_settings["SWIFT_VERSION"] = "4.2"
               config.build_settings["ENABLE_BITCODE"] = "NO"
               config.build_settings["EXPANDED_CODE_SIGN_IDENTITY"] = ""
               config.build_settings["CODE_SIGNING_REQUIRED"] = "NO"
               config.build_settings["CODE_SIGNING_ALLOWED"] = "NO"
             end
           end

           installer.pods_project.save
         },

         # Change to dsym: true and Release config for production
         dsym: false,
         configuration: "Debug",
       }

target "Canoe" do
  # Analytics
  pod "Crashlytics"
  pod "Fabric"

  # Utils
  pod "R.swift"
  pod "ReactorKit"
  #   pod 'RxOptional'
  #   pod 'RxSwiftExt'
  pod "RxSwift"
  pod "RxCocoa"

  # Testing
  pod "Quick"
  pod "RxNimble"
end
