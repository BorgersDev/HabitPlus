//
//  SignUpUIState.swift
//  HabitPlus
//
//  Created by Arthur Borges on 25/12/23.
//

import Foundation

enum SignUpUIState: Equatable {
    case none
    case loading
    case sucess
    case error(String)
}
