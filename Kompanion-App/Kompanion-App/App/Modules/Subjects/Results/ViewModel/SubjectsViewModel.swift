import Foundation
import SwiftData

class SubjectsViewModel: ObservableObject {
    
    @Published var subjects: [Subject] = []
    
    private var repository: SubjectsRepositoryProtocol
    
    init(repository: SubjectsRepositoryProtocol = SubjectsRepository()) {
        self.repository = repository
        self.repository.output = self
    }
    
    func fetchSubjects(_ context: ModelContext) {
        repository.fetchSubjects(context)
    }
}

extension SubjectsViewModel : SubjectsRepositoryOutput {
    
    func fetchSubjectsSuccess(_ subjects: [Subject]) {
        self.subjects = subjects
    }
    
    func fetchSubjectsFailure(_ error: any Error) {
        print(error.localizedDescription)
    }
    
}
