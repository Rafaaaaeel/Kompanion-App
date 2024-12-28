import SwiftUI

struct SubjectSectionsView : View {
    
    @State private var showingCredits = false
    
    private let adaptativeColumns = [GridItem(.adaptive(minimum: 170))]
    
    var title: LocalizedStringKey
    
    init(title: LocalizedStringKey) {
        self.title = title
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            KTitle()
                .text(title)
                .font(.h2)
                .rounded(true)
                .padding()
            
            LazyVGrid(columns: adaptativeColumns, spacing: 16) {
                ForEach((1...5), id: \.self) { index in
                    ZStack {
                        if index == 1 {
                            SubjectCreateCardView()
                                .onTouch {
                                    showingCredits.toggle()
                                }
                        } else {
                            NavigationLink {
                                TimerView()
                            } label: {
                                SubjectCardView()
                            }
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
        .sheet(isPresented: $showingCredits) {
            SubjectCreationView()
                .presentationDetents([.medium, .large])
        }
        .padding(.top)
    }
}


#Preview {
    SubjectSectionsView(title: "Today")
}
