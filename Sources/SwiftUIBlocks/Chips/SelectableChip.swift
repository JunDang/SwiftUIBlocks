import SwiftUI

public struct SelectableChip: View {
    
    public typealias ActionHandler = () -> Void
    private let text: String
    private let isSelected: Bool
    private let systemIconString: String?
    private let color: Color
    private let action: ActionHandler
    
    public init(text: String,
                systemIconString: String? = nil,
                color: Color = .blue,
                isSelected: Bool = false,
                action: @escaping ActionHandler = { }) {
        self.text = text
        self.isSelected = isSelected
        self.action = action
        self.systemIconString = systemIconString
        self.color = color
    }
    
    public var body: some View {
        Button(action: action) {
            HStack(spacing: 4) {
                if let systemIconString {
                    Image(systemName: systemIconString)
                        .font(.caption)
                }
                Text(text)
                    .font(.subheadline)
                    .fontWeight(.medium)
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)
            .background(isSelected ? color : Color.gray.opacity(0.15))
            .foregroundStyle(isSelected ? .white : .primary)
            .cornerRadius(20)
        }
        .buttonStyle(.plain)
        .accessibilityLabel(text)
        .accessibilityValue(isSelected ? "Selected" : "Not selected")
        .accessibilityHint("Double tap to \(isSelected ? "deselect" : "select")")
        .accessibilityAddTraits(isSelected ? [.isButton, .isSelected] : .isButton)
    }
}

#Preview("Interactive Multi-Selection") {
    struct InteractiveMultiDemo: View {
        @State private var selected: Set<String> = []
        
        let items = ["Item1", "Item2", "Item3", "Item4", "Item5"]
        
        var body: some View {
            VStack(spacing: 16) {
                Text("Select multiple items")
                    .font(.headline)
                
                FlowLayout(spacing: 8) {
                    ForEach(items, id: \.self) { item in
                        SelectableChip(
                            text: item,
                            systemIconString: "star.fill",
                            isSelected: selected.contains(item),
                            action: {
                                if selected.contains(item) {
                                    selected.remove(item)
                                } else {
                                    selected.insert(item)
                                }
                            }
                        )
                    }
                }
                
                if !selected.isEmpty {
                    Text("Selected: \(selected.sorted().joined(separator: ", "))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .multilineTextAlignment(.center)
                }
            }
            .padding()
        }
    }
    
    return InteractiveMultiDemo()
}


#Preview("Dark Mode") {
    struct DarkModeDemo: View {
        @State private var selectedItems: Set<String> = ["Item 2"]
        
        let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
        
        var body: some View {
            VStack(spacing: 16) {
                Text("Dark Mode Chips")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    ForEach(items, id: \.self) { item in
                        SelectableChip(
                            text: item,
                            isSelected: selectedItems.contains(item),
                            action: {
                                if selectedItems.contains(item) {
                                    selectedItems.remove(item)
                                } else {
                                    selectedItems.insert(item)
                                }
                            }
                        )
                    }
                }
            }
            .padding()
            .preferredColorScheme(.dark)
        }
    }
    
    return DarkModeDemo()
}


#Preview("Interactive Single Selection") {
    struct InteractiveSingleDemo: View {
        @State private var selectedChip: String? = nil
        
        let items = ["Item 1", "Item 2", "Item 3", "Item 4"]
        
        var body: some View {
            VStack(spacing: 16) {
                Text("Select Character Type")
                    .font(.headline)
                
                HStack(spacing: 12) {
                    ForEach(items, id: \.self) { option in
                        SelectableChip(
                            text: option,
                            isSelected: selectedChip == option,
                            action: { selectedChip = option }
                        )
                    }
                }
                
                if let selected = selectedChip {
                    Text("Selected: \(selected)")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
            }
            .padding()
        }
    }
    
    return InteractiveSingleDemo()
}
