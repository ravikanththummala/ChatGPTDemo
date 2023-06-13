//
//  HistoryView.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import SwiftUI
import CoreData

struct HistoryView: View {
    @Environment(\.dismiss) private var dismiss
    
    @EnvironmentObject private var model:Model
    
    @FetchRequest(sortDescriptors: [NSSortDescriptor(key: "dateCreated", ascending: true)]) private var historyItemResults:FetchedResults<HistoryItem>
    
    var body: some View {
        List(historyItemResults){ historyItem in
            Text(historyItem.question ?? "")
                .fontWeight(.bold)
                .frame(maxWidth: .infinity,alignment: .leading)
                .contentShape(Rectangle())
                .onTapGesture {
                    model.query = Query(question: historyItem.question ?? "" , answer: historyItem.answer ?? "")
                    dismiss()
                }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
            .environmentObject(Model())
    }
}
