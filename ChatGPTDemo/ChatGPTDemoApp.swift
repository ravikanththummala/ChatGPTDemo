//
//  ChatGPTDemoApp.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import SwiftUI
import CoreData
@main
struct ChatGPTDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
                .environmentObject(Model())
        }
    }
}
//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
