import SwiftUI

struct SubjectCardView : View {
    
    private let onTouch: () -> Void
    
    @State private var taping = false
    
    private let iconName: String
    private let title: String
    
    init(title: String, iconName: String, onTouch: @escaping () -> Void = {}) {
        self.onTouch = onTouch
        self.title = title
        self.iconName = iconName
    }
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .fill(Color.blue)
                .frame(height: 115)
            VStack {
                HStack {
                    HStack {
                        Image(systemName: iconName)
                            .foregroundStyle(Color.white)
                        Spacer()
                        KTitle()
                            .text(LocalizedStringKey(title))
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
        return .init(title: self.title, iconName: self.iconName, onTouch: action)
    }
}


#Preview {
    SubjectCardView(title: "Test", iconName: "cart")
}
