//
//  Kompanion_AppApp.swift
//  Kompanion-App
//
//  Created by Rafael Oliveira on 26/11/24.
//

import SwiftUI
import SwiftData

@main
struct MainApp: App {
    
    private var subjectContainer: ModelContainer = {
        do {
            let scheme = Schema([Subject.self])
            let configuration = ModelConfiguration(isStoredInMemoryOnly: Settings.instance.isPreview)
            let container = try ModelContainer(for: scheme, configurations: [configuration])
            return container
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
    }()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem {
                        Image(systemName: "house")
                        Text("House")
                    }
                    .modelContainer(subjectContainer)
                SubjectsView()
                    .tabItem {
                        Image(systemName: "book.closed.fill")
                        Text("Subjects")
                    }
                    .modelContainer(subjectContainer)
                HomeView()
                    .tabItem {
                        Image(systemName: "list.bullet.rectangle")
                        Text("Reminders")
                    }
                    .modelContainer(subjectContainer)
                HomeView()
                    .tabItem {
                        Image(systemName: "gearshape")
                        Text("Config")
                    }
            }
        }
    }
}
