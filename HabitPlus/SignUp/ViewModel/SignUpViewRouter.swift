//
//  SignUpViewRouter.swift
//  HabitPlus
//
//  Created by Arthur Borges on 25/12/23.
//

import SwiftUI

enum SignUpViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
}
