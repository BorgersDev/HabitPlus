//
//  LogInVIewRouter.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import SwiftUI

enum LogInViewRouter {
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
