import SwiftUI

struct SubjectHeaderView : View {
    
    var body: some View {
        HStack {
            Image(systemName: "xmark")
            Spacer()
            KTitle()
                .text("Subject Creation")
                .font(.h4)
            Spacer()
        }.padding()
    }
    
}


#Preview {
    SubjectHeaderView()
}
