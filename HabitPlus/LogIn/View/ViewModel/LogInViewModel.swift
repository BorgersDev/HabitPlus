//
//  LogInViewModel.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI
import Combine

class LogInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    
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
    
    
    func login(){
        self.uiState = .loading
       
        WebService.login (request: LogInRequest (email: email,
                                                 password: password)) { (successResponse,
                                                                         errorResponse) in
            
            if let error = errorResponse {
                DispatchQueue.main.async {
                    self.uiState = .error(error.detail)

                }
            }
            
            if let success = successResponse {
                DispatchQueue.main.async {
                    print(success)
                    self.uiState = .goToHomeScreen
                }
            }
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
