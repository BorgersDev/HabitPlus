//
//  LogInVIewRouter.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import SwiftUI
import Combine

enum LogInViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
    
    static func makeSignUpView(publisher: PassthroughSubject<Bool, Never>) -> some View {
        let viewModel = SignUpViewModel()
        viewModel.publisher = publisher
        return SignUpView(viewModel: viewModel)
    }
}
