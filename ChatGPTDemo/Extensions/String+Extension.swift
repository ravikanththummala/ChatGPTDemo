//
//  String+Extension.swift
//  ChatGPTDemo
//
//  Created by Ravikanth Thummala on 6/12/23.
//

import Foundation

extension String {
    var isEmptyOrWhiteSpace: Bool{
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
