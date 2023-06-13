//
//  Query.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import Foundation
import SwiftUI
struct Query:Identifiable, Hashable {
    
    let id = UUID()
    let question:String
    let answer:String
    
}
