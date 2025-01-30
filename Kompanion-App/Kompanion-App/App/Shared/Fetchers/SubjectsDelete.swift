import SwiftData

protocol SubjectsDelete {
    var deleteOutput: SubjectDeleteOutput? { get }
    
    func delete(_ context: ModelContext, subject: Subject)
}

protocol SubjectDeleteOutput {
    func deleteSubjectSuccess(_ context: ModelContext)
    func deleteSubjectFailure(error: Error)
}

extension SubjectsDelete {
    
    func delete(_ context: ModelContext, subject: Subject) {
        context.delete(subject)
        deleteOutput?.deleteSubjectSuccess(context)
    }
    
}
