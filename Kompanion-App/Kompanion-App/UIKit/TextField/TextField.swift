import SwiftUI

struct KTextField : View {
    
    @State private var borderColor: Color = .gray
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Subject")

            ZStack {
                HStack {
                    TextField("Name", text: .constant(""), onEditingChanged: didFocus)
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
    KTextField()
}
