//
//  LogInUIState.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import Foundation

enum LogInUIState: Equatable {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
