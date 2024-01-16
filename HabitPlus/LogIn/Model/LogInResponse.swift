//
//  LogInResponse.swift
//  HabitPlus
//
//  Created by Arthur Borges on 15/01/24.
//

import Foundation

struct LogInResponse: Decodable {
    
    let acessToken: String
    let refreshToken: String
    let expires: Int
    let tokenType: String
    
    
    enum CodingKeys: String, CodingKey {
        case acessToken = "acess_token"
        case refreshToken = "refresh_token"
        case expires
        case tokenType = "token_type"    }
}
