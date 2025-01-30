import SwiftUI

struct SubjectSectionsView : View {
    
    @State private var isShowingCreation = false
    
    private let subjects: [Subject]
    private let adaptativeColumns = [GridItem(.adaptive(minimum: 170))]
    
    private let onDismiss: () -> Void
    private let onDelete: (Int) -> Void
    
    private var length: Int {
        subjects.count <= 0 ? 1 : subjects.count + 1
    }
    var title: LocalizedStringKey
    
    init(title: LocalizedStringKey, subjects: [Subject], onDismiss: @escaping () -> Void, onDelete: @escaping (Int) -> Void) {
        self.title = title
        self.subjects = subjects
        self.onDismiss = onDismiss
        self.onDelete = onDelete
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            KTitle()
                .text(title)
                .font(.h2)
                .rounded(true)
                .padding()
            
            LazyVGrid(columns: adaptativeColumns, spacing: 16) {
                ForEach(0..<length, id: \.self) { index in
                    ZStack {
                        if index == 0 {
                            SubjectCreateCardView()
                                .onTouch {
                                    isShowingCreation.toggle()
                                }
                        } else {
                            NavigationLink {
                                TimerView()
                            } label: {
                                SubjectCardView(title: subjects[index - 1].name, iconName: subjects[index - 1].icon, onDelete: {
                                    onDelete(index - 1)
                                })
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isShowingCreation) {
            SubjectCreationView(action: {
                isShowingCreation.toggle()
                onDismiss()
            })
                .presentationDetents([.medium])
        }
        .padding(.top)
    }
}

