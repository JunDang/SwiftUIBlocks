import SwiftUI

// MARK: - Count Badge (for notifications)
struct CountBadge: View {
    let count: Int
    let color: Color
    let accessibilityLabel: String
    init(_ count: Int, color: Color = .red, accessibilityLabel: String = "") {
        self.count = count
        self.color = color
        self.accessibilityLabel = accessibilityLabel
    }
    
    var body: some View {
        Text(countText)
            .font(.caption2)
            .fontWeight(.bold)
            .padding(.horizontal, count > 9 ? 6 : 4)
            .padding(.vertical, 2)
            .frame(minWidth: 18, minHeight: 18)
            .background(color)
            .foregroundStyle(.white)
            .clipShape(Capsule())
            .accessibilityLabel(accessibilityLabel)
            .accessibilityAddTraits(.isStaticText)
    }
    
    private var countText: String {
        count > 99 ? "99+" : "\(count)"
    }
}

#Preview("Count Badges") {
    HStack(spacing: 20) {
        CountBadge(3, accessibilityLabel: "3 messages not read yet")
        CountBadge(12)
        CountBadge(99, accessibilityLabel: "you have more than 99 messages")
        CountBadge(150, accessibilityLabel: "\(50)")
        
    }
    .padding()
}
