//
//  SplashViewModel.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    @Published var uiState: SplashUIState = .loading

    func onAppear() {
        // faz algo assincrono e muda o estado da uiState
        DispatchQueue.main.asyncAfter(deadline: .now() + 3){
//            self.uiState = .error("Not Found")
            self.uiState = .goToLoginScreen
        }
    }
    func logInView() -> some View {
        return SplashVIewRouter.makeLogInView()
    }
}
