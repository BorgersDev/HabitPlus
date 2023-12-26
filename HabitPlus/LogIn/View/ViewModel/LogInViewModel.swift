//
//  LogInViewModel.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI
import Combine

class LogInViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    
    private let publisher = PassthroughSubject<Bool, Never>()
    
    @Published var uiState: LogInUIState = .none
    
    init() {
        cancellable = publisher.sink { value in
            print("Usuário criado goToHome: \(value)")
            
            if value {
                self.uiState = .goToHomeScreen
            }
        }
    }
    
    deinit {
    cancellable?.cancel()
    }
    
    
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
    func signUpView() -> some View {
        return LogInViewRouter.makeSignUpView(publisher: publisher)
    }
}
