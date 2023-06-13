//
//  MainView.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import SwiftUI
import OpenAISwift
struct MainView: View {
    
    let openAi = OpenAISwift(authToken: "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")
    
    @State private var chatText:String = ""
    @EnvironmentObject private var model:Model
    
    
    private var isFormValid: Bool {
        !chatText.isEmptyOrWhiteSpace
    }
    
    private func performSearch(){
        openAi.sendCompletion(with: chatText,maxTokens: 500) { result in
            
            switch result {
            case .success(let success):
                let values = success.choices?.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                
                let query = Query(question: chatText, answer: values)
                DispatchQueue.main.async {
                    model.queries.append(query)
                }
                
                do{
                    try model.saveQuery(query)
                }catch{
                    print(error.localizedDescription)
                }
                chatText = ""
            case .failure(let failure):
                print(failure)
                
            }
        }
    }
    
    var body: some View {
        VStack{
            
            ScrollView {
                
                ScrollViewReader{ proxy in
                    ForEach(model.queries){ value in
                        VStack(alignment: .leading){
                            Text(value.question)
                                .fontWeight(.bold)
                            
                            Text(value.answer)
                        }.padding([.bottom],10)
                            .frame(maxWidth:.infinity,alignment: .leading)
                            .listRowSeparator(.hidden)
                            .id(value.id)
                    }.listStyle(.plain)
                        .onChange(of: model.queries) { newValue in
                            if !model.queries.isEmpty{
                                let lastQuery = model.queries[model.queries.endIndex - 1]
                                withAnimation {
                                    proxy.scrollTo(lastQuery.id)
                                }
                            }
                        }
                }
       
            }.padding()
          
            Spacer()
            HStack{
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                Button {
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless)
                    .tint(.blue)
                    .disabled(!isFormValid)
                
            }.padding()
                .onChange(of: model.query) { newValue in
                    model.queries.append(newValue)
                }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
    }
}
