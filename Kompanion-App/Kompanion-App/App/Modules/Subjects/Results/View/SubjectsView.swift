import SwiftUI

struct SubjectsView: View {
    
    @ObservedObject private var viewModel = SubjectsViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    SubjectSectionsView(title: "Today")
                    SubjectSectionsView(title: "All")
                }
            }
        }
    }
}

#Preview {
    SubjectsView()
        .environment(\.locale, Locale(identifier: "EN"))
}
