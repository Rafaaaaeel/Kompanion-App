import SwiftUI

struct HomeView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 80) {
                TodaySectionView()
                ProgressSectionView()
            }
        }
    }
}

#Preview("pt_BR") {
    HomeView()
        .environment(\.locale, Locale(identifier: "pt_BR"))
}

#Preview("En") {
    HomeView()
        .environment(\.locale, Locale(identifier: "EN"))
}
