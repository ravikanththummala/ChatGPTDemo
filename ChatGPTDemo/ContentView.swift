//
//  ContentView.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented:Bool = false
    
    var body: some View {
        NavigationStack{
            MainView()
                .sheet(isPresented: $isPresented,content: {
                    NavigationStack{
                        HistoryView()
                            .navigationTitle("History")
                    }
                })
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            isPresented.toggle()
                        } label: {
                            Text("Show History")
                        }
                        
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(Model())
        
    }
}
