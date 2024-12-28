import SwiftUI

struct SubjectCardView : View {
    
    private let onTouch: () -> Void
    
    @State private var taping = false
    
    init(onTouch: @escaping () -> Void = {}) {
        self.onTouch = onTouch
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .frame(height: 115)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: "pencil")
                            .foregroundStyle(Color.white)
                        Spacer()
                        KTitle()
                            .text("Math")
                            .font(.h5)
                            .rounded(true)
                        Spacer()
                    }
                    Spacer()
                    
                }
                .padding()
                
                VStack {
                    HStack {
                        KParagraph()
                            .font(.p16)
                            .text("1/3")
                        Spacer()
                        KParagraph()
                            .font(.p16)
                            .text("15 Strike")
                    }
                    KProgressBar(targetProgress: 2, isHorizontal: false)
                }
                .padding()
            }
        }
        .opacity(taping ? 0.75 : 1)
        .onLongPressGesture(
            perform: {},
            onPressingChanged: { _ in
                withAnimation(.smooth(duration: 0.15)) {
                  taping.toggle()
                }
            }
        )
        .onTapGesture {
            withAnimation(.smooth(duration: 0.18)) {
              taping.toggle()
            } completion: {
                taping.toggle()
            }
            onTouch()
        }
    }
    
    func onTouch(_ action: @escaping () -> Void) -> SubjectCardView {
        return .init(onTouch: action)
    }
}


#Preview {
    SubjectCardView()
}
