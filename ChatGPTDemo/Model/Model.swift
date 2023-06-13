//
//  Model.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import Foundation

class Model:ObservableObject{
    @Published var queries:[Query] = []
    @Published var query = Query(question: "", answer: "")
    
    func saveQuery(_ query:Query) throws {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.answer = query.answer
        historyItem.question = query.question
        historyItem.dateCreated = Date()
        try viewContext.save()
    }
    
    
}

