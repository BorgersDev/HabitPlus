//
//  LogInViewModel.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI

class LogInViewModel: ObservableObject {
    @Published var uiState: LogInUIState = .none
    
    func login(email: String, password: String){
        self.uiState = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
//              self.uiState = .error("Not Found")
            self.uiState = .goToHomeScreen
        }
    }
}

extension LogInViewModel {
    func homeView() -> some View {
        return LogInViewRouter.makeHomeView()
    }
}
