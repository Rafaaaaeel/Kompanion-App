import SwiftUI

struct TimerView : View {
    var body: some View {

        VStack(spacing: 8){
            KTitle()
                .text("Math")
                .font(.h4)
                .rounded(true)
            KTitle()
                .text("5:00")
                .font(.h1)
                .rounded(true)
            KButton()
                .image(systemName: "pause.fill")
                .label("Pause")
            
        }
        .padding()
        .toolbar(.hidden, for: .tabBar)
    }
}

#Preview {
    TimerView()
}
