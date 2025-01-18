import SwiftUI

struct DaysOfTheWeekView : View  {
    
    private let selection: (String, Bool) -> Void
    private let daysOfTheWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    init(selection: @escaping (String, Bool) -> Void) {
        self.selection = selection
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            KParagraph(color: .primary)
                .text("Days")
                .font(.p16)
            HStack(spacing: 30) {
                ForEach(daysOfTheWeek, id: \.self) { dayOfTheWeek in
                    KTextButton(LocalizedStringKey(dayOfTheWeek), isSelectionButton: true, selected: false, selection: selection)
                }
            }
        }.padding(.horizontal)
        
    }
}

#Preview {
    DaysOfTheWeekView() { text, value in
        print("Foo")
    }
}
