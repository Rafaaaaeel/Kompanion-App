import Foundation

extension Array where Element == Subject {
    func subjectsForToday() -> [Subject] {
        self.filter { $0.daysOfTheWeek[Date.shortWeekday] == true }
    }
}
