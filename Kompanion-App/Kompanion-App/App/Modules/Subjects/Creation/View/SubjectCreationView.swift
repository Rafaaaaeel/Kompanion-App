import SwiftUI

struct SubjectCreationView : View {
    var body: some View {
        NavigationView {
            VStack(spacing: 32) {
                VStack(spacing: 24) {
                    KTextField()
                    IconSelectionView()
                    DaysOfTheWeekView()
                }
                Spacer()
                KButton()
                    .label("DONE")
            }
            .padding()
        }.navigationTitle("Subject Creation")
    }
}


#Preview {
    SubjectCreationView()
}
