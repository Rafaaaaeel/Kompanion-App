import Foundation
import SwiftData
import SwiftUICore

class SubjectCreationViewModel: SubjectCreationViewModelProtocol {
    
    @Published internal var isValidToSave : Bool = false
    
    @Published private var name: String = ""
    @Published private var icon: String = ""
    @Published private var days: [String: Bool] = [:]
    
    private let repository: CreationRepository
    
    init(repository: CreationRepository = CreationRepository()) {
        self.repository = repository
        self.repository.ouput = self
    }
    
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
    
    func didCreateSubject(_ context: ModelContext) {
        repository.create(
            Subject(name: name,
                    daysOfTheWeek: days,
                    icon: icon),
            context: context)
    }
}

extension SubjectCreationViewModel: SubjectCreationRepositoryProtocolOutput {
    
    func createSuccess() {
        print("Created")
    }
    
    func createFailure() {
        print("Failed")
    }
    
}

extension SubjectCreationViewModel {
    
    private func isValid() {
        isValidToSave = isNameValid() && isIconValid() && isDaysValid()
    }
    
    private func isNameValid() -> Bool {
        return !name.isEmpty
    }
    
    private func isIconValid() -> Bool {
        return !icon.isEmpty
    }
    
    private func isDaysValid() -> Bool {
        return !days.isEmpty
    }
    
}
