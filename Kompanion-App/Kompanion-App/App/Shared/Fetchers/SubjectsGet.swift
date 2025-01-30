import SwiftData

protocol SubjectsFetch {
    var fetchOutput: SubjectsFetchOutput? { get }
    
    func fetchSubjects(_ context: ModelContext)
}

protocol SubjectsFetchOutput: AnyObject {
    func fetchSubjectsSuccess(_ subjects: [Subject])
    func fetchSubjectsFailure(_ error: Error)
}

extension SubjectsFetch {
    
    func fetchSubjects(_ context: ModelContext) {
        do {
            let data = try context.fetch(FetchDescriptor<Subject>())
            
            fetchOutput?.fetchSubjectsSuccess(data)
        } catch let error {
            fetchOutput?.fetchSubjectsFailure(error)
        }
        
    }
    
}
