//
//  Persistence.swift
//  buildhouseproject
//
//  Created by pooh on 29/12/2565 BE.
//
import CoreData
struct PersistenceController {
    static let shared = PersistenceController()
    let container: NSPersistentContainer
    init() {
        container = NSPersistentContainer(name: "MyReserve")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Container load failed: \(error)")
            }
        }
    }
}

