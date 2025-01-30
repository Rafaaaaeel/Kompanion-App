import Foundation

class Settings {
    
    static let instance = Settings()
    
    private init() { }
    
    var isPreview: Bool {
        ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != nil
    }
    
    
}
