import SwiftUI

public typealias Action = () -> Void

public struct KButton : View {
    
    private let title: LocalizedStringKey
    private let image: String
    private let onTouch: () -> Void
    private let isLocked: Bool
    
    @State private var taping = false
    
    
    public init(title: LocalizedStringKey = .empty, image: String = .empty, isLocked: Bool = false, onTouch: @escaping Action = {}) {
        self.title = title
        self.onTouch = onTouch
        self.isLocked = isLocked
        self.image = image
    }
    
    public var body: some View {
        Button {
            if !isLocked {
                onTouch()
            }
        } label: {
            HStack(alignment: .center) {
                Text(title)
                    .bold()
                    .fontDesign(.rounded)
                Image(systemName: image)
            }.frame(maxWidth: .infinity)
        }
        .shadow(color: !isLocked ? .blue : .clear, radius: 10, x: 0, y: 6)
        .buttonStyle(.borderedProminent)
        .tint(!isLocked ? .blue : .gray)
        .controlSize(.large)
        .scaleEffect(taping  && !isLocked ? 0.95 : 1)
        .onLongPressGesture(
              perform: {},
              onPressingChanged: { pressing in
                  if !isLocked {
                      withAnimation(.smooth(duration: 0.2)) {
                        taping.toggle()
                      }
                  }
              }
            )
    }
    
    public func label(_ title: LocalizedStringKey) -> KButton {
        return .init(title: title, image: self.image, isLocked: self.isLocked, onTouch: self.onTouch)
    }
    
    public func image(systemName: String) -> KButton {
        return .init(title: self.title, image: systemName, isLocked: self.isLocked, onTouch: self.onTouch)
    }
    
    public func onTouch(_ action: @escaping () -> Void) -> KButton {
        return .init(title: self.title, image: self.image, isLocked: self.isLocked, onTouch: action)
    }
    
    public func isEnabled(_ value: Bool) -> KButton {
        return .init(title: self.title, image: self.image, isLocked: value, onTouch: self.onTouch)
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
