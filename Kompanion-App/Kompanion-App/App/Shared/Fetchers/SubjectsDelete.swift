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
        do {
            context.delete(subject)
            try context.save()
            deleteOutput?.deleteSubjectSuccess(context)
        } catch let error {
            deleteOutput?.deleteSubjectFailure(error: error)
        }
    }
    
}
