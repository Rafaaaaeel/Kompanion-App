import SwiftUI

struct TodaySectionView : View {
    var body: some View {
        VStack(alignment: .leading) {
            KTitle()
                .font(.h2)
                .text("Today")
                .rounded(true)
                .padding()
            
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    CardView()
                    CardView()
                    CardView()
                    CardView()
                }
            }
            .scrollIndicators(.never)
        }
    }
}

#Preview {
    TodaySectionView()
}
