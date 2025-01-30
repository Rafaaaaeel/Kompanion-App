import SwiftUI

struct SubjectCardView : View {
    
    private let onTouch: () -> Void
    private let onDelete: () -> Void
    
    @State private var isEditMode = true
    @State private var taping = false
    
    private let iconName: String
    private let title: String
    
    init(title: String, iconName: String, onTouch: @escaping () -> Void = {}, onDelete: @escaping () -> Void = {}) {
        self.onTouch = onTouch
        self.onDelete = onDelete
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
                            .lineLimit(1)
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
            
            if isEditMode {
                VStack {
                    HStack(alignment: .top) {
                        Spacer()
                        ZStack {
                            Circle()
                               .fill(Color.red)
                               .frame(width: 25, height: 25)
                            Image(systemName: "minus")
                                .foregroundStyle(Color.white)
                            
                        }.offset(x: 7, y: -55)
                    }.foregroundStyle(.red)
                }.onTapGesture {
                    onDelete()
                }
            }
        }
        .opacity(taping ? 0.75 : 1)
    }
    
    func onTouch(_ action: @escaping () -> Void) -> SubjectCardView {
        return .init(title: self.title, iconName: self.iconName, onTouch: action)
    }
}


#Preview {
    SubjectCardView(title: "Test", iconName: "cart")
}
