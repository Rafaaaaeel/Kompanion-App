// MARK: IMPORTS
import SwiftUI

/// Component
///
/// Use this when wants to create a title for a section in the app.
///
/// ```swift
/// K_Title()
///     .text(value: "4:54")
///     .font(.h2)
/// ```
/// ## Parameters
///
/// Text
///
/// FontSize
public struct KTitle: View {
    
    // MARK: PARAMETERS
    private let text: LocalizedStringKey
    private let fontSize: FontSize.Header
    private let rounded: Bool
    
    // MARK: ATTRIBUTES
    private var font: Font {
        return .system(size: fontSize.rawValue, design: rounded ? .rounded : .default)
    }

    private var color: Color {
        switch fontSize {
        case .h4:
            return .gray
        case .h5:
            return .white
        default:
            return .primary
        }
    }
    
    private var aligment: TextAlignment {
        switch fontSize {
        case .h4:
            return .center
        default:
            return .leading
        }
    }
    
    // MARK: INIT
    public init(text: LocalizedStringKey = "", fontSize: FontSize.Header = FontSize.Header.h4, roudend: Bool = false) {
        self.text = text
        self.fontSize = fontSize
        self.rounded = roudend
    }
    
    // MARK: VIEW CONSTRUCTOR
    public var body: some View {
        Text(text)
            .bold()
            .font(font)
            .foregroundStyle(color)
            .multilineTextAlignment(aligment)
    }
    
    // MARK: BUILDERS
    public func font(_ fontSize: FontSize.Header) -> KTitle {
        return .init(text: self.text, fontSize: fontSize, roudend: self.rounded)
    }
    
    public func text(_ value: LocalizedStringKey) -> KTitle {
        return .init(text: value, fontSize: self.fontSize, roudend: self.rounded)
    }
    
    public func rounded(_ value: Bool) -> KTitle {
        return .init(text: self.text, fontSize: self.fontSize, roudend: value)
    }
    
}

// MARK: - PREVIEWS

#Preview("h1") {
    VStack {
        KTitle()
            .text("4:54")
            .font(.h1)
    }
}

#Preview("h2") {
    VStack {
        KTitle()
            .text("4:54")
            .font(.h2)
    }
}

#Preview("h3") {
    VStack {
        KTitle()
            .text("4:54")
            .font(.h3)
    }
}

#Preview("h4") {
    VStack {
        KTitle()
            .text("Select your subject and\nmake it done")
            .font(.h4)
    }
}

#Preview("h5") {
    VStack {
        KTitle()
            .text("Math")
            .font(.h5)
            .preferredColorScheme(.dark)
    }
}
