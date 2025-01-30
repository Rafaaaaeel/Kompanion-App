import SwiftUI

struct SubjectsView: View {
    
    @Environment(\.modelContext) private var modelContext
    @ObservedObject private var viewModel = SubjectsViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Spacer()
                        KTextButton("Edit", isSelectionButton: false, selected: false) { _, _ in
                            
                        }
                    }.padding(.trailing)

                    SubjectSectionsView(title: "Today", subjects: viewModel.todaysSubjects) {
                        fetchSubjects()
                    } onDelete: { index in
                        deleteSubject(at: index)
                    }
                    SubjectSectionsView(title: "All", subjects: viewModel.allSubjects) {
                        fetchSubjects()
                    } onDelete: { index in
                        deleteSubject(at: index)
                    }
                }
            }.onAppear() {
                fetchSubjects()
            }
        }
        
    }
    
    private func fetchSubjects() {
        viewModel.fetchSubjects(modelContext)
    }
    
    private func deleteSubject(at index: Int) {
        viewModel.deleleteSubject(modelContext, at: index)
    }
}

#Preview {
    SubjectsView()
        .environment(\.locale, Locale(identifier: "EN"))
}
