import Foundation
import SwiftData
import SwiftUICore

class SubjectCreationViewModel: SubjectCreationViewModelProtocol {
    
    @Published internal var nameIsValid : Bool = false
    @Published internal var iconIsValid : Bool = false
    @Published internal var daysIsValid : Bool = false
    @Published private var name: String = ""
    @Published private var icon: String = ""
    @Published private var days: [String] = []
    
    private let repository: CreationRepository
    
    init(repository: CreationRepository = CreationRepository()) {
        self.repository = repository
        self.repository.ouput = self
    }
    
    // TODO: validation of each letter
    func didText(_ name: String) {
        self.name = name
    }
    
    // TODO: manage selection of days of the week
    func didSelect(week day: String) {
        self.days.append(day)
    }
    
    func didPick(_ icon: String) {
        self.icon = icon
    }
    
    func didCreateSubject(_ context: ModelContext) {
        
        guard isValid() else { return }
        
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
    
    private func isValid() -> Bool {
        
        self.nameIsValid = isNameValid()
        self.iconIsValid = isIconValid()
        self.daysIsValid = isDaysValid()
        
        return nameIsValid && iconIsValid && daysIsValid
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
