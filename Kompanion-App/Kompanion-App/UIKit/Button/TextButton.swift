import SwiftUI

struct KTextButton : View {
    
    private var label: LocalizedStringKey
    private var isSelectionButton: Bool
    
    init(_ label: LocalizedStringKey, isSelectionButton: Bool, selected: Bool) {
        self.label = label
        self.isSelectionButton = isSelectionButton
        self.selected = selected
    }
    
    @State private var color: Color = .red
    @State private var selected: Bool = false
    
    var body: some View {
        Button(action: {
            if isSelectionButton {
                selected = !selected
            }
        }) {
            Text(label)
                .bold()
                .foregroundStyle(!isSelectionButton ? .blue : self.selected ? .blue : .primary)
        }.buttonStyle(.borderless)
            
            
    }
}


#Preview {
    KTextButton("tap me", isSelectionButton: true, selected: true)
}
