//
//  CoreDataManager.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import Foundation
import CoreData

class CoreDataManager {
    
    let persistentContainer :NSPersistentContainer
    static let shared = CoreDataManager()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "HistoryModel")
        persistentContainer.loadPersistentStores { desc, error in
            if let error{
                fatalError("Core Data store failed \(error.localizedDescription)")
            }
        }
    }
}
