import Foundation


extension Date {
    
    static var shortWeekday: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US")
        let shortWeekdaySymbols = dateFormatter.shortWeekdaySymbols ?? []
        let currentWeekdayIndex = Calendar.current.component(.weekday, from: Date()) - 1

        return shortWeekdaySymbols[currentWeekdayIndex]
    }
    
}
