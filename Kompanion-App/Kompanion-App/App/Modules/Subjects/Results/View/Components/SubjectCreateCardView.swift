import SwiftUI

struct SubjectCreateCardView : View {
    
    private let onTouch: () -> Void
    
    init(onTouch: @escaping () -> Void = {}) {
        self.onTouch = onTouch
    }
    
    var body: some View {
        ZStack {
            Image(systemName: "plus")
                .imageScale(.large)
                .foregroundStyle(.blue)
            RoundedRectangle(cornerRadius: 12)
                .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                .foregroundStyle(.blue)
                .frame(height: 115)
        }
        .onTapGesture {
            onTouch()
        }
    }
    
    func onTouch(_ action: @escaping () -> Void) -> SubjectCreateCardView {
        return .init(onTouch: action)
    }
}

#Preview {
    SubjectCreateCardView()
}
