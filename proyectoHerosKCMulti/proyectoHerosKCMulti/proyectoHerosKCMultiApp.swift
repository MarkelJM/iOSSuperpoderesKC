//
//  proyectoHerosKCMultiApp.swift
//  proyectoHerosKCMulti
//
//  Created by Markel Juaristi on 15/3/23.
//

import SwiftUI
/*
 @main
 struct proyectoHerosKCMultiApp: App {
 //let persistenceController = PersistenceController.shared
 
 @StateObject var rootViewModel = RootViewModel()
 
 var body: some Scene {
 WindowGroup {
 LoginView()
 .environmentObject(rootViewModel)
 }
 }
 }
 */


@main
struct proyectoHerosKCMultiApp: App {
  //let persistenceController = PersistenceController.shared
    @StateObject var rootViewModel = RootViewModel()
    
    var body: some Scene {
        WindowGroup {
          
            RootView()
                .environmentObject(rootViewModel)
               
            
        }
    }
}
