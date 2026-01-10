import SwiftUI

struct Chip: View {
    let text: String
    let color: Color
    let accessibilityLabel: String
    
    var body: some View {
        Text(text)
            .font(.caption)
            .fontWeight(.medium)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(color.opacity(0.15))
            .foregroundStyle(color)
            .cornerRadius(16)
            .accessibilityLabel(accessibilityLabel)
            .accessibilityAddTraits(.isStaticText)
            
    }
}

