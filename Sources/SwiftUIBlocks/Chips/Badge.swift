import SwiftUI

struct Badge: View {
    let text: String
    let color: Color
    let icon: String?
    let style: BadgeStyle
    
    enum BadgeStyle {
        case filled
        case outlined
        case soft
    }
    
    init(_ text: String,
         color: Color = .blue,
         icon: String? = nil,
         style: BadgeStyle = .soft) {
        self.text = text
        self.color = color
        self.style = style
        self.icon = icon
    }
    
    var body: some View {
        HStack(spacing: 4) {
            if let icon {
                Image(systemName: icon)
                    .font(.caption2)
            }
            Text(text)
        }
        .font(.caption)
        .fontWeight(.medium)
        .padding(.horizontal, 10)
        .padding(.vertical, 5)
        .background(backgroundColor)
        .foregroundStyle(foregroundColor)
        .cornerRadius(12)
        .overlay {
            if style == .outlined {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(color, lineWidth: 1)
            }
        }
    }
    
    private var backgroundColor: Color {
        switch style {
        case .filled: return color
        case .outlined: return .clear
        case .soft: return color.opacity(0.15)
        }
    }
    
    private var foregroundColor: Color {
        switch style {
        case .filled: return .white
        case .outlined: return color
        case .soft: return color
        }
    }
}

// MARK: - Convenience Initializers
extension Badge {
    static func good(_ text: String = "Good") -> Badge {
        Badge(text, color: .green, style: .soft)
    }
    
    static func bad(_ text: String = "Bad") -> Badge {
        Badge(text, color: .red, style: .soft)
    }
    
    static func neutral(_ text: String = "Neutral") -> Badge {
        Badge(text, color: .gray, style: .soft)
    }
    
    static func info(_ text: String) -> Badge {
        Badge(text, color: .blue, style: .soft)
    }
    
    static func warning(_ text: String) -> Badge {
        Badge(text, color: .orange, style: .soft)
    }
}

// MARK: - Previews
#Preview("Badge Styles") {
    VStack(spacing: 16) {
        HStack {
            Badge("Soft", color: .blue, icon: "star.fill", style: .soft)
            Badge("Filled", color: .blue, icon: "bolt.fill", style: .filled)
            Badge("Outlined", color: .blue, style: .outlined)
        }
        
        HStack {
            Badge.good()
            Badge.bad()
            Badge.neutral()
        }
        
        HStack {
            Badge.info("New")
            Badge.warning("Beta")
        }
    }
    .padding()
}
