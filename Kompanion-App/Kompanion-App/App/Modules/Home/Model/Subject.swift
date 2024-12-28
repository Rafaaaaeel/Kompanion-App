import Foundation
import SwiftData


@Model
class Subject {
    var id: String
    var name: String
    var creationDate: Date
    var maxStrike: Int
    var currentStrike: Int
    var daysOfTheWeek: [String]
    var icon: String
    
    init(id: UUID, name: String, creationDate: Date, maxStrike: Int, currentStrike: Int, daysOfTheWeek: [String], icon: String) {
        self.id = UUID().uuidString
        self.name = name
        self.creationDate = creationDate
        self.maxStrike = maxStrike
        self.currentStrike = currentStrike
        self.daysOfTheWeek = daysOfTheWeek
        self.icon = icon
    }
}
