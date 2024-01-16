//
//  SplashVIewRouter.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUIre

enum SplashVIewRouter {
    static func makeLogInView() -> some View {
        let viewModel = LogInViewModel()
        return  LogInView(viewModel: viewModel)
    }
}
