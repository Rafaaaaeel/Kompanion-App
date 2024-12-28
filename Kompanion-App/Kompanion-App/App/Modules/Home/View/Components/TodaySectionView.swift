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
                HStack(spacing: 8) {
                    CardView()
                    CardView()
                    CardView()
                    CardView()
                }
            }
            .scrollIndicators(.never)
            .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0))
        }
    }
}

#Preview {
    TodaySectionView()
}
