import SwiftUI

struct ConstrainedBadge: View {
    let text: String
    let backgroundColor: Color
    let foregroundColor: Color
    let maxWidth: CGFloat
    
    init(_ text: String, foregroundColor: Color = .black, backgroundColor: Color = .purple, maxWidth: CGFloat = 150) {
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.maxWidth = maxWidth
    }
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .frame(maxWidth: maxWidth, alignment: .leading)
            .fixedSize(horizontal: false, vertical: true)  // Allow text to wrap
            .background(backgroundColor.opacity(0.15))
            .foregroundStyle(foregroundColor)
            .cornerRadius(12)
    }
}


#Preview("Hero Power Tags") {
    VStack(spacing: 12) {
        ConstrainedBadge("Super Strength", foregroundColor: .red, backgroundColor: .red)
        
        ConstrainedBadge("Flight & Invulnerability", foregroundColor: .blue, backgroundColor: .blue)
        
        ConstrainedBadge("Telepathy", foregroundColor: .purple, backgroundColor: .purple)
        
        ConstrainedBadge("Wall Crawling & Spider Sense", foregroundColor: .red, backgroundColor: .red, maxWidth: 180)
    }
    .padding()
}

#Preview("Dark Mode") {
    VStack(spacing: 20) {
        ConstrainedBadge("Default Badge")
        
        ConstrainedBadge("Success Badge", foregroundColor: .green, backgroundColor: .green)
        
        ConstrainedBadge("Very long badge text that wraps to multiple lines in dark mode")
    }
    .padding()
    .preferredColorScheme(.dark)
}

#Preview("List Integration") {
    List {
        Section("Heroes") {
            HStack {
                Text("Superman")
                Spacer()
                ConstrainedBadge("Flying", foregroundColor: .blue, backgroundColor: .blue, maxWidth: 100)
            }
            
            HStack {
                Text("Spider-Man")
                Spacer()
                ConstrainedBadge("Wall Crawling", foregroundColor: .red, backgroundColor: .red, maxWidth: 100)
            }
            
            HStack {
                Text("Wonder Woman")
                Spacer()
                ConstrainedBadge("Super Strength", foregroundColor: .purple, backgroundColor: .purple, maxWidth: 100)
            }
        }
    }
}
