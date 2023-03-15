//
//  proyectoHerosKCMultiApp.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 15/3/23.
//

import SwiftUI

@main
struct proyectoHerosKCMultiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            /*
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
             */
        }
    }
}
