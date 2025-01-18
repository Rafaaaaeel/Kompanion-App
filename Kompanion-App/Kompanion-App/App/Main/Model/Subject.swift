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
    
    init(id: String = UUID().uuidString, name: String, creationDate: Date = Date(), maxStrike: Int = 0, currentStrike: Int = 0, daysOfTheWeek: [String], icon: String) {
        self.id = id
        self.name = name
        self.creationDate = creationDate
        self.maxStrike = maxStrike
        self.currentStrike = currentStrike
        self.daysOfTheWeek = daysOfTheWeek
        self.icon = icon
    }
}
