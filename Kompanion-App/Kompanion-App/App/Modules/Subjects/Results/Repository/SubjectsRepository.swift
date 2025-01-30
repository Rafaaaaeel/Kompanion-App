import SwiftData

class SubjectsRepository : SubjectsRepositoryProtocol {
    var output: SubjectsRepositoryOutput?
}

extension SubjectsRepository {
    
    var fetchOutput: (any SubjectsFetchOutput)? { output }
    var deleteOutput: (any SubjectDeleteOutput)? { output }
    
}

protocol SubjectsRepositoryProtocol: SubjectsFetch, SubjectsDelete {
    var output: SubjectsRepositoryOutput? { get set }
}

protocol SubjectsRepositoryOutput: SubjectsFetchOutput, SubjectDeleteOutput { }


// Delete protocol

// Create protocol

// Edit protocol
