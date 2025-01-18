import SwiftUI

struct KIconButton: View {
    
    private let iconName: String
    private let action: () -> Void
    
    init(iconName: String, action: @escaping () -> Void) {
        self.iconName = iconName
        self.action = action
    }
    
    var body : some View {
        Button(action: {
            action()
        }) {
            Image(systemName: iconName)
        }.buttonStyle(.borderless)
    }
}


#Preview {
    KIconButton(iconName: "cart") {
        print("Hello world")
    }
}
