//
//  SplashView.swift
//  HabitPlus
//
//  Created by Arthur Borges on 21/12/23.
//

import SwiftUI

struct SplashView: View {
    @ObservedObject var viewModel: SplashViewModel
    
    @State var emaiil = ""
    @State var password = ""
    
    var body: some View {
        Group {
            switch viewModel.uiState {
            case .loading:
                loadingView()
            case .goToLoginScreen:
                viewModel.logInView()
            case .goToHomeScreen:
                Text("Home Screen")
            case .error(let msg):
                loadingView(error: msg)
            }
        }.onAppear(perform:viewModel.onAppear)
    }
}
extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding(20)
                .ignoresSafeArea()

        if let error = error {
            Text("")
                .alert(isPresented: .constant(true)) {
                    Alert(title:Text("Habit"), message:Text(error), dismissButton: .default(Text("Ok")) {
                        // happens after pressing "Ok"
                    })
                }
            }
        }
    }
}


#Preview {
    SplashView(viewModel: SplashViewModel())
}
#Preview {
    SplashView(viewModel: SplashViewModel())
        .preferredColorScheme(.dark)
}
