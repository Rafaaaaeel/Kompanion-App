import Foundation
import SwiftData
import SwiftUICore

class SubjectCreationViewModel: SubjectCreationViewModelProtocol {
    
    @Published internal var model: SubjectCreationModel = .init()
    @Published internal var isValidToSave: Bool = false
    @Published internal var isSuccess: Bool = false
    
    private let repository: CreationRepository
    
    init(repository: CreationRepository = CreationRepository()) {
        self.repository = repository
        self.repository.ouput = self
        
        model.$isValidToSave
                    .assign(to: &$isValidToSave)

    }
    
    func didText(_ name: String) {
        model.didText(name)
    }
    
    func didSelect(week day: String, selected: Bool) {
        model.didSelect(week: day, selected: selected)
    }
    
    func didPick(_ icon: String) {
        model.didPick(icon)
    }
    
    func didCreateSubject(_ context: ModelContext) {
        repository.create(model.build(), context: context)
    }
}

extension SubjectCreationViewModel: SubjectCreationRepositoryProtocolOutput {
    
    func createSuccess() {
        isSuccess = true
    }
    
    func createFailure() {
        isSuccess = false
    }
    
}
