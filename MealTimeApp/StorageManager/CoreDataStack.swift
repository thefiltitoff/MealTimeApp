//
//  CoreDataStack.swift
//  MealTimeApp
//
//  Created by Felix Titov on 6/13/22.
//  Copyright © 2022 by Felix Titov. All rights reserved.
//  


import Foundation
import CoreData

class CoreDataStack {
    
    static let shared = CoreDataStack()
    
    // MARK: - Core Data stack
    var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "MealTimeApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext
    
    private init() {
        context = persistentContainer.viewContext
    }
    
    // MARK: - Core Data Saving support
    func saveContext () {

        if context.hasChanges {
            do {
                try context.save()
            } catch {
  
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    
}
