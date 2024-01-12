//
//  ErrorResponse.swift
//  HabitPlus
//
//  Created by Arthur Borges on 09/01/24.
//

import Foundation

struct ErrorResponse: Decodable {
    let detail: String
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
}
