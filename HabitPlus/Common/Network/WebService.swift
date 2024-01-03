//
//  WebService.swift
//  HabitPlus
//
//  Created by Arthur Borges on 02/01/24.
//

import Foundation

enum WebService {
    
    enum Endpoint: String {
        case base = "https://habitplus-api.tiagoaguiar.co"
        
        case postUser = "/users"
    }
      
    
        
        static func postUser(fullName: String,
                             email: String,
                             password: String,
                             document: String,
                             phoneNumber: String,
                             birthDate: String,
                             gender: Int) {
            
            let json: [String: Any] = [
                "name": fullName,
                "email": email,
                "document": document,
                "phone": phoneNumber,
                "gender": gender,
                "birthday": birthDate,
                "password": password
            ]
            
            let jsonData = try? JSONSerialization.data(withJSONObject: json)
    }
}
