import Foundation
import SwiftData

class SubjectsViewModel: ObservableObject {
    
    @Published var allSubjects: [Subject] = []
    @Published var todaysSubjects: [Subject] = []
    
    private var repository: SubjectsRepositoryProtocol
    
    init(repository: SubjectsRepositoryProtocol = SubjectsRepository()) {
        self.repository = repository
        self.repository.output = self
    }
    
    func fetchSubjects(_ context: ModelContext) {
        repository.fetchSubjects(context)
    }
    
    func deleleteSubject(_ context: ModelContext, at index: Int) {
        repository.delete(context, subject: allSubjects[index])
    }
    
}

extension SubjectsViewModel : SubjectsRepositoryOutput {
    
    func deleteSubjectSuccess(_ context: ModelContext) {
        repository.fetchSubjects(context)
    }
    
    func deleteSubjectFailure(error: any Error) {
        print("Not Deleted")
    }
    
    func fetchSubjectsSuccess(_ subjects: [Subject]) {
        self.todaysSubjects = subjects.subjectsForToday()
        self.allSubjects = subjects
    }
    
    func fetchSubjectsFailure(_ error: any Error) {
        print(error.localizedDescription)
    }
    
}
