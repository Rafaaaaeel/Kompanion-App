import SwiftUI

public extension LocalizedStringKey {
    
    static var empty: Self { LocalizedStringKey(String()) }
    
    func toString(locale: Locale = .current) -> String {
        let mirror = Mirror(reflecting: self)
        if let value = mirror.descendant("key") as? String {
            return value
        }
        return .empty
    }
    
}

public extension String {
    
    static var empty: Self { String() }
    
}

extension LocalizedStringKey {
    
}
