import SwiftUI

struct KTextField : View {
    
    private let title: String
    private let placeholder: String
    private let didSubmit: (String) -> Void
    
    @State private var text: String = ""
    @State private var borderColor: Color = .gray
    
    init(title: String, placeholder: String, didSubmit: @escaping (String) -> Void) {
        self.title = title
        self.placeholder = placeholder
        self.didSubmit = didSubmit
    }
    
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)

            ZStack {
                HStack {
                    TextField(placeholder, text: $text, onEditingChanged: didFocus)
                        .onSubmit {
                            didSubmit(text)
                        }
                        .submitLabel(.done)
                        .onChange(of: text) { oldValue, newValue in
                            print(newValue)
                        }
                }.padding()
                
            }.overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
            )
                .cornerRadius(10)
            
        }
        
    }
    
    private func didFocus(_ onAction: Bool) {
        borderColor = onAction ? .blue : .gray
    }
}


#Preview {
    KTextField(title: "Subject", placeholder: "Name") { text in
        // do nothing
    }
}
