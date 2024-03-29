//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by Frank Bara on 12/8/21.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            DownloadWithEscapingBootcamp()
//            CodeableBootcamp()
//            WeakSelfBootcamp()
//            BackgroundThreadBootcamp()
//            ContentView()
//            CoreDataRelationships()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
