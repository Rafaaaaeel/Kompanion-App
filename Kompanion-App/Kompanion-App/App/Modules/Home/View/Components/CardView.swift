import SwiftUI

struct CardView : View {
    var body: some View {
        ZStack {
            HStack {
                KTitle()
                    .font(.h5)
                    .text("Math")
                Spacer()
                Image(systemName: "pencil")
                    .foregroundStyle(Color.white)
                
            }
            .padding()

        }
        .frame(width: 161, height: 43)
        .background(Color.blue)
        .clipShape(.rect(cornerRadius: 10))
    }
}

#Preview {
    CardView()
}
