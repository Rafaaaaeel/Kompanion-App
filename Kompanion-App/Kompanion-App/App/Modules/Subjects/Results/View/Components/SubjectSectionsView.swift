import SwiftUI

struct SubjectSectionsView : View {
    
    @State private var isShowingCreation = false
    
    private let subjects: [Subject]
    private let adaptativeColumns = [GridItem(.adaptive(minimum: 170))]
    
    private var length: Int {
        subjects.count <= 0 ? 1 : subjects.count + 1
    }
    var title: LocalizedStringKey
    
    init(title: LocalizedStringKey, subjects: [Subject]) {
        self.title = title
        self.subjects = subjects
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
                            SubjectCardView(title: subjects[index - 1].name, iconName: subjects[index - 1].icon)
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $isShowingCreation) {
            SubjectCreationView(action: {
                isShowingCreation.toggle()
            })
                .presentationDetents([.medium])
        }
        .padding(.top)
    }
}


#Preview {
//    SubjectSectionsView(title: "Today")
}
