import SwiftUI

struct ProgressSectionView : View {
    var body : some View {
        VStack(spacing: 16) {
            ZStack {
                KProgressBar(isHorizontal: true)
                    .setProgress(8)
                VStack(spacing: 8) {
                    Spacer()
                    KTitle()
                        .font(.h2)
                        .text("Studying goals")
                        .rounded(true)
                    KTitle()
                        .font(.h4)
                        .text("Select your subject and\nmake it done")
                        .rounded(true)
                }
            }
            KTitle()
                .font(.h1)
                .text("5:00")
                .rounded(true)
            KButton()
                .label("My subjects")
                .onTouch {
                    print("SHOW SUBJECTS")
                }
        }.padding()
    }
}

#Preview {
    ProgressSectionView()
}
