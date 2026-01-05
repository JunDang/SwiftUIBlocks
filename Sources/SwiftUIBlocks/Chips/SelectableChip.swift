import SwiftUI

public struct SelectableChip: View {
    
    public typealias ActionHandler = () -> Void
    private let text: String
    private let isSelected: Bool
    private let action: ActionHandler
    
    public init(text: String,
                isSelected: Bool = false,
                action: @escaping ActionHandler = { }) {
        self.text = text
        self.isSelected = isSelected
        self.action = action
    }
    
    public var body: some View {
        Button(action: action) {
            Text(text)
                .font(.caption)
                .fontWeight(.medium)
                .padding(.horizontal, 12)
                .padding(.vertical, 6)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.15))
                .foregroundStyle(isSelected ? .white : .primary)
                .cornerRadius(16)
        }
        .buttonStyle(.plain)
    }
}
