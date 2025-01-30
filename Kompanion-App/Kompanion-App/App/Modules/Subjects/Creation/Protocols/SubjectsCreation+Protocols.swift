import SwiftData
import SwiftUICore

protocol SubjectCreationRepositoryProtocol {
    var ouput: SubjectCreationRepositoryProtocolOutput? { get set }
    
    func create(_ subject: Subject, context: ModelContext)
}

protocol SubjectCreationRepositoryProtocolOutput: AnyObject {
    
    func createSuccess()
    func createFailure()
    
}

extension SubjectCreationRepositoryProtocol {
    func create(_ subject: Subject, context: ModelContext) {
        
        context.insert(subject)
        
        do {
            try context.save()
            
            ouput?.createSuccess()
        } catch {
            ouput?.createFailure()
        }
        
    }
}


protocol SubjectCreationViewModelInput {
    func didText(_ name: String)
    func didSelect(week day: String, selected: Bool)
    func didPick(_ icon: String)
    func didCreateSubject(_ context: ModelContext)
}

protocol SubjectCreationViewModelProtocol: ObservableObject, SubjectCreationViewModelInput { }
