import SwiftUI

struct SubjectsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel = SubjectsViewModel()
    
    var body: some View {
        ScrollView {
            VStack {
                SubjectSectionsView(title: "Today", subjects: viewModel.subjects)
                SubjectSectionsView(title: "All", subjects: viewModel.subjects)
            }
        }.onAppear() {
            viewModel.fetchSubjects(modelContext)
        }
    }
}

#Preview {
    SubjectsView()
        .environment(\.locale, Locale(identifier: "EN"))
}
