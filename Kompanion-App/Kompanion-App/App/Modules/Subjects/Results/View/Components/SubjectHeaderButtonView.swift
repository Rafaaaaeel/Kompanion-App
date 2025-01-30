import SwiftUI

struct SubjectHeaderButtonView : View {
    
    private let title: LocalizedStringKey
    private let action: () -> Void
    
    init(title: LocalizedStringKey, action: @escaping () -> Void) {
        self.title = title
        self.action = action
    }
    
    var body: some View {
        HStack(alignment: .center) {
            Spacer()
            KTextButton(title, isSelectionButton: false, selected: false) { _, _ in
                action()
            }
            Spacer()
        }
        .frame(width: .infinity, height: 44)
        .border(.gray, width: 0.5)
        .onTapGesture {
            action()
        }
    }
}

#Preview {
    SubjectHeaderButtonView(title: "Test") {
        print("Foo - 2")
    }
}
