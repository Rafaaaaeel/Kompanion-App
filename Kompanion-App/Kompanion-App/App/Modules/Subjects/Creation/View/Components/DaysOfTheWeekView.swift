import SwiftUI

struct DaysOfTheWeekView : View  {
    
    private let daysOfTheWeek = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            KParagraph(color: .primary)
                .text("Days")
                .font(.p16)
            HStack(spacing: 24) {
                ForEach(daysOfTheWeek, id: \.self) { dayOfTheWeek in
                    KTextButton(LocalizedStringKey(dayOfTheWeek), isSelectionButton: true, selected: false)
                }
            }
        }
        
    }
}

#Preview {
    DaysOfTheWeekView()
}
