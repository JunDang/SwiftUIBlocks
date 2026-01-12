import SwiftUI

public struct OfflineBanner: View {
    
    private let lastSyncDate: Date?
    
    public init(lastSyncDate: Date?) {
        self.lastSyncDate = lastSyncDate
    }
    
    public var body: some View {
        HStack(spacing: 8) {
            Image(systemName: "wifi.slash")
                .font(.caption)
            
            VStack(alignment: .leading, spacing: 2) {
                Text("Offline Mode")
                    .font(.caption)
                    .fontWeight(.medium)
                
                if let lastSync = lastSyncDate {
                    Text("Last updated: \(lastSync.formatted(.relative(presentation: .named)))")
                        .font(.caption2)
                        .foregroundStyle(.white.opacity(0.8))
                }
            }
            
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .background(Color.orange.gradient)
        .foregroundStyle(.white)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Offline mode. \(lastSyncDateLabel)")
    }
    
    private var lastSyncDateLabel: String {
        if let lastSync = lastSyncDate {
            return "Last updated \(lastSync.formatted(.relative(presentation: .named)))"
        }
        return ""
    }
}

#Preview("With Date") {
    OfflineBanner(lastSyncDate: Date.now.addingTimeInterval(-3600))
}

#Preview("Without Date") {
    OfflineBanner(lastSyncDate: nil)
}
