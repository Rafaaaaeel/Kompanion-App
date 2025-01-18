import SwiftUI

struct IconSelectionView: View {
    
    
    private let selection: (String) -> Void
    private let icons = ["cart", "cart.fill", "pause", "person", "keyboard", "MORE"]
    
    @State private var selectedIcon: String? = nil
    
    init(selection: @escaping (String) -> Void) {
        self.selection = selection
    }
    
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 16) {
            KParagraph(color: .primary)
                .font(.p16)
                .text("Icon")
                .padding(.leading)
            ScrollView(.horizontal) {
                HStack {
                    ForEach(icons, id: \.self) { icon in
                        if icon == "MORE" {
                            KTextButton("More", isSelectionButton: false, selected: false) { text, isSeleted in
                                print("Foo")
                            }
                                .padding(.leading)
                        } else {
                            Button(action: {
                                selectedIcon = selectedIcon == icon ? nil : icon
                                selection(selectedIcon.orEmpty)
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
                            }.padding(.leading)
                        }
                    }
                }
            }
            
        }
    }
}

#Preview {
    IconSelectionView() { name in
        
    }
}
