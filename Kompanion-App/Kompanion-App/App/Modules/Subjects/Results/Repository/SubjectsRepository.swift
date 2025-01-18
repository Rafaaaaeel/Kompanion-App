import SwiftData

class SubjectsRepository : SubjectsRepositoryProtocol {
    
    var output: SubjectsRepositoryOutput?
}

extension SubjectsRepository {
    
    var fetchOutput: (any SubjectsFetchOutput)? { output }
    
}

protocol SubjectsRepositoryProtocol: SubjectsFetch {
    var output: SubjectsRepositoryOutput? { get set }
}

protocol SubjectsRepositoryOutput: SubjectsFetchOutput { }


// Get Protocol
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


// Delete protocol

// Create protocol

// Edit protocol
