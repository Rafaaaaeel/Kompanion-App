import SwiftUI

struct IconSelectionView: View {
    
    private let icons = ["cart", "cart.fill", "pause", "person", "keyboard"]
    
    @State private var selectedIcon: String? = nil
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            KParagraph(color: .primary)
                .font(.p16)
                .text("Icon")
            HStack(spacing: 24) {
                ForEach(icons, id: \.self) { icon in
                    Button(action: {
                        selectedIcon = selectedIcon == icon ? nil : icon
                    }) {
                        ZStack {
                            Image(systemName: icon)
                                .foregroundColor(selectedIcon == icon ? .white : .black)
                        }
                        .frame(width: 48, height: 48)
                        .background(selectedIcon == icon ? Color.blue : Color.clear)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.gray, lineWidth: selectedIcon == icon ? 0 : 1)
                        )
                        .cornerRadius(10)
                    }
                }
            }
        }
    }
}

#Preview {
    IconSelectionView()
}
