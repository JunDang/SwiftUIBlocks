import SwiftUI
import SwiftUIBlocks

// MARK: - Selectable Example
struct FlowLayoutExample: View {
    let allTags = ["Swift", "SwiftUI", "UIKit", "Combine", "Async/Await", "Core Data", "SwiftData", "Testing", "Instruments", "Networking"]
    
    @State private var selectedTags: Set<String> = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Select Your Skills")
                .font(.headline)
            FlowLayout {
                ForEach(allTags, id: \.self) { tag in
                    SelectableChip(
                        text: tag,
                        isSelected: selectedTags.contains(tag)
                    ) {
                        if selectedTags.contains(tag) {
                            selectedTags.remove(tag)
                        } else {
                            selectedTags.insert(tag)
                        }
                    }
                }
            }
            
            if !selectedTags.isEmpty {
                Text("Selected: \(selectedTags.sorted().joined(separator: ", "))")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .padding()
    }
}

// MARK: - Previews
#Preview("Flow Layout") {
    FlowLayoutExample()
}

