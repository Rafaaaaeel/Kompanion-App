import SwiftUI

class SubjectCreationModel: ObservableObject {
    
    @Published internal var name: String = ""
    @Published internal var icon: String = ""
    @Published internal var days: [String: Bool] = [:]
    
    @Published private(set) internal var isValidToSave : Bool = false
    
    // TODO: validation of each letter
    func didText(_ name: String) {
        self.name = name
        
        isValid()
    }
    
    // TODO: manage selection of days of the week
    func didSelect(week day: String, selected: Bool) {
        self.days[day] = selected
        
        isValid()
    }
    
    func didPick(_ icon: String) {
        self.icon = icon
        
        isValid()
    }
    
    func build() -> Subject {
        Subject(name: name, daysOfTheWeek: days, icon: icon)
    }
    
}

extension SubjectCreationModel {
    
    private func isValid() {
        isValidToSave = !name.isEmpty && !icon.isEmpty && !days.isEmpty
    }
    
}
