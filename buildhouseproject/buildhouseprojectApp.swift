//
//  buildhouseprojectApp.swift
//  buildhouseproject
//
//  Created by pooh on 8/11/2565 BE.
//



import SwiftUI

@main
struct MyScoreBook2App: App {
    
    let persistenceController = PersistenceController.shared
    
    
    var body: some Scene {
        WindowGroup {
           
               
                

                WelcomeScreenView()
                    .environment(\.managedObjectContext,persistenceController.container.viewContext)
            
        }
        
        
    }
}
