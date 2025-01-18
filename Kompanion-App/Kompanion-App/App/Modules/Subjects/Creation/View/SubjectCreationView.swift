import SwiftUI

struct SubjectCreationView : View {
    
    private let action: () -> Void
    
    @Environment(\.modelContext) private var context
    @ObservedObject private var viewModel = SubjectCreationViewModel()
    
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 24) {
                    Spacer()
                    KTextField(title: "Subject", placeholder: "Name") { name in
                        viewModel.didText(name)
                    }.padding(.horizontal)
                    IconSelectionView() { icon in
                        viewModel.didPick(icon)
                    }
                    DaysOfTheWeekView() { day, isSelected in
                        viewModel.didSelect(week: day)
                    }
                    Spacer()
                }
                Spacer()
                KButton()
                    .label("DONE")
                    .onTouch {
                        viewModel.didCreateSubject(context)
                        
                        if viewModel.daysIsValid && viewModel.nameIsValid && viewModel.iconIsValid {
                            action()
                        }
                        
                    }
                    .padding()
            }
            .navigationBarTitle("Subject Creation", displayMode: .inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    KIconButton(iconName: "xmark") {
                        action()
                    }
                }
            }
        }
    }
    
}

struct BottomSheetPreviewWrapper: View {
    @State private var isSheetPresented = true

    var body: some View {
        Text("Tap to Show Bottom Sheet")
            .onAppear {
                isSheetPresented = true
            }
            .sheet(isPresented: $isSheetPresented) {
                SubjectCreationView(action: {
                    isSheetPresented.toggle()
                })
                    .presentationDetents([.medium])
                    .presentationDragIndicator(.visible)
            }
    }
}

#Preview {
    BottomSheetPreviewWrapper()
}
