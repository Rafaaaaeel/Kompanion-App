import SwiftUI

struct SubjectsActionsHeaderView : View {
    
    var didText: (String) -> Void
    var didEdit: () -> Void
    var didFilter: () -> Void

    init(didText: @escaping (String) -> Void, didEdit: @escaping () -> Void, didFilter: @escaping () -> Void) {
        self.didText = didText
        self.didEdit = didEdit
        self.didFilter = didFilter
    }
    
    var body: some View {
       
        VStack(alignment: .center) {
            VStack {
                HStack {
                    KTitle()
                        .font(.h2)
                        .text("Subjects")
                    Spacer()
                }
                KTextField(title: "", placeholder: "Search") { text in
                    didText(text)
                }
            }.padding(.horizontal)
            
            HStack {
                SubjectHeaderButtonView(title: "Filter") {
                    didFilter()
                }
                SubjectHeaderButtonView(title: "Edit") {
                    didEdit()
                }
            }
            .padding(.top)
        }
    }
}

#Preview {
    SubjectsActionsHeaderView() { text in
        
    } didEdit: {
        
    } didFilter: {
        
    }
}
