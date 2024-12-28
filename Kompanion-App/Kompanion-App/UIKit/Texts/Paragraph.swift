import SwiftUI

public struct KParagraph : View {
    
    private var text: LocalizedStringKey
    private var fontSize: FontSize.Paragraph
    private var color: Color
    
    
    private var font: Font {
        return .system(size: fontSize.rawValue)
    }
    
    public init(text: LocalizedStringKey = "", fontSize: FontSize.Paragraph = .p12, color: Color = .white) {
        self.text = text
        self.fontSize = fontSize
        self.color = color
    }
        
    public var body : some View {
        Text(text)
            .font(font)
            .foregroundStyle(color)
    }
    
    public func font(_ type: FontSize.Paragraph) -> KParagraph {
        return .init(text: self.text, fontSize: type, color: self.color)
    }
    
    public func text(_ value: LocalizedStringKey) -> KParagraph {
        return .init(text: value, fontSize: self.fontSize, color: self.color)
    }
}


#Preview {
    KParagraph()
        .font(.p14)
}
