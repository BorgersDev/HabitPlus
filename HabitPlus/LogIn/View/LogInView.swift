//
//  LogInView.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject var viewModel: LogInViewModel
    
    @State var action: Int? = 0
    
    @State var navigationBarHidden = true
    
    var body: some View {
        ZStack {
            if case LogInUIState.goToHomeScreen = viewModel.uiState {
                viewModel.homeView()
            } else {
                NavigationView {
                    
                    ScrollView(showsIndicators: false){
                                            
                            Spacer(minLength: 110)
                            
                            VStack(alignment: .center) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                    .padding(.horizontal, 40)
                                
                                Text("Login")
                                    .foregroundColor(.orange)
                                    .font(.title.bold())
                                    .padding(.bottom, 8)
                                
                                emailField
                                
                                passwordField
                                
                                enterButton
                                
                                registerLink
                                
                                Text("Copyright @BSCO")
                                    .foregroundColor(Color.gray)
                                    .font(Font.system(size: 13).bold())
                                    .padding(.top, 30)
                                
                            }
                        if case LogInUIState.error(let value ) = viewModel.uiState{
                            Text("")
                                .alert(isPresented: .constant(true)) {
                                    Alert(title:Text("Habit"), message:Text(value), dismissButton: .default(Text("Ok")) {
                                        // happens after pressing "Ok"
                                    })
                                }
                        }
                        
                    }.frame(maxWidth: .infinity,  maxHeight: .infinity)
                        .padding(.horizontal, 25)
                        .navigationBarTitle("Login", displayMode: .inline)
                        .navigationBarHidden(navigationBarHidden)
                }
            }
        }
        
    }
}

extension LogInView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Invalid email",
                     failure: !viewModel.email.isEmail())
    }
}

extension LogInView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
        placeholder: "Password",
        keyboard: .emailAddress,
        error: "Invalid password",
                     failure: viewModel.password.count < 8,
        isSecure: true)
    }
}
extension LogInView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.login()
        }, text: "Log in",showProgress: self.viewModel.uiState == LogInUIState.loading, disabled: !viewModel.email.isEmail() || viewModel.password.count < 8)
        .padding(.top, 15)
    }
        
}

extension LogInView {
    var registerLink: some View {
        
            ZStack {
                Text("Don't have an account?")
                    .foregroundColor(.gray)
                
                NavigationLink(
                    destination: viewModel.signUpView(),
                    tag: 1,
                    selection: $action,
                    label: {EmptyView()})
                
                Button("Sign Up") {
                    self.action = 1
                }.padding(.top, 55)
            }
        }
    }

#Preview {
    LogInView(viewModel: LogInViewModel())
}
#Preview {
    LogInView(viewModel: LogInViewModel())
        .colorScheme(.dark)
}
