import class Foundation.Bundle

extension Foundation.Bundle {
    static var module: Bundle = {
        let mainPath = Bundle.main.bundlePath + "/" + "ToastProvider_ToastProvider.bundle"
        let buildPath = "/Users/harrybloom/development/ios/ToastProvider/.build/x86_64-apple-macosx/debug/ToastProvider_ToastProvider.bundle"

        let preferredBundle = Bundle(path: mainPath)

        guard let bundle = preferredBundle != nil ? preferredBundle : Bundle(path: buildPath) else {
            fatalError("could not load resource bundle: from \(mainPath) or \(buildPath)")
        }

        return bundle
    }()
}