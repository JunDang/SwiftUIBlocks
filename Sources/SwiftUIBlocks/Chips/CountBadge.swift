import SwiftUI

// MARK: - Count Badge (for notifications)
struct CountBadge: View {
    let count: Int
    let color: Color
    
    init(_ count: Int, color: Color = .red) {
        self.count = count
        self.color = color
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
    }
    
    private var countText: String {
        count > 99 ? "99+" : "\(count)"
    }
}

#Preview("Count Badges") {
    HStack(spacing: 20) {
        CountBadge(3)
        CountBadge(12)
        CountBadge(99)
        CountBadge(150)
    }
    .padding()
}
