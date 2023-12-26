//
//  Gender.swift
//  HabitPlus
//
//  Created by Arthur Borges on 25/12/23.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String {
        self.rawValue
    }
}
