import SwiftUI

struct RecentSearchesView: View {
    var body: some View {
        VStack {
            Text("Recent Searches")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            // Add your recent searches list here
            Spacer()
        }
        .navigationTitle("Recent Searches")
        .background(.dark2)
    }
}

#Preview {
    RecentSearchesView()
} 