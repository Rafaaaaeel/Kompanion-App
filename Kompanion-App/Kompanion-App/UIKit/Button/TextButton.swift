import SwiftUI

struct KTextButton : View {
    
    private let label: LocalizedStringKey
    private let isSelectionButton: Bool
    private let selection: (String, Bool) -> Void
    
    init(_ label: LocalizedStringKey, isSelectionButton: Bool, selected: Bool, selection: @escaping (String, Bool) -> Void) {
        self.label = label
        self.isSelectionButton = isSelectionButton
        self.selected = selected
        self.selection = selection
    }
    
    @State private var color: Color = .red
    @State private var selected: Bool = false
    
    var body: some View {
        Button(action: {
            if isSelectionButton {
                selected = !selected
            }
            
            selection(label.toString(), selected)
        }) {
            Text(label)
                .bold()
                .foregroundStyle(!isSelectionButton ? .blue : self.selected ? .blue : .primary)
                .lineLimit(1)
                .minimumScaleFactor(0.9)
        }.buttonStyle(.borderless)

    }
}


#Preview {
    KTextButton("tap me", isSelectionButton: true, selected: true) { (text, isSelected) in
        print("You picked \(text), and is \(isSelected)")
    }
}
