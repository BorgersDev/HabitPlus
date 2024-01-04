//
//  SignUpRequest.swift
//  HabitPlus
//
//  Created by Arthur Borges on 03/01/24.
//

import Foundation

struct SignUpRequest: Encodable {
    
    let fullName: String
    let email: String
    let password: String
    let document: String
    let phoneNumber: String
    let birthDate: String
    let gender: Int
    
    
    enum CodingKeys: String, CodingKey {
        case fullName = "name"
        case email
        case password
        case document
        case phoneNumber = "phone"
        case birthDate = "birthday"
        case gender
    }
}
