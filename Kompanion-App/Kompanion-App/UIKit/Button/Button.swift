import SwiftUI

public typealias Action = () -> Void

public struct KButton : View {
    
    private let title: LocalizedStringKey
    private let image: String
    private let onTouch: () -> Void
    
    @State private var taping = false
    
    public init(title: LocalizedStringKey = .empty, image: String = .empty, onTouch: @escaping Action = {}) {
        self.title = title
        self.onTouch = onTouch
        self.image = image
    }
    
    public var body: some View {
        Button {
            onTouch()
        } label: {
            HStack(alignment: .center) {
                Text(title)
                    .bold()
                    .fontDesign(.rounded)
                Image(systemName: image)
            }.frame(maxWidth: .infinity)
        }
        .shadow(color: .blue, radius: 10, x: 0, y: 6)
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        .scaleEffect(taping ? 0.95 : 1)
        .onLongPressGesture(
              perform: {},
              onPressingChanged: { pressing in
                withAnimation(.smooth(duration: 0.2)) {
                  taping.toggle()
                }
              }
            )
    }
    
    public func label(_ title: LocalizedStringKey) -> KButton {
        return .init(title: title, image: self.image, onTouch: self.onTouch)
    }
    
    public func image(systemName: String) -> KButton {
        return .init(title: self.title, image: systemName, onTouch: self.onTouch)
    }
    
    public func onTouch(_ action: @escaping () -> Void) -> KButton {
        return .init(title: self.title, image: self.image, onTouch: action)
    }
    
}


#Preview {
    VStack {
        KButton()
            .label("DONE")
            .image(systemName: "pause.fill")
            .onTouch {
                print("it worked")
            }
    }
}
