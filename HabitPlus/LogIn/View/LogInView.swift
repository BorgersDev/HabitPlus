//
//  LogInView.swift
//  HabitPlus
//
//  Created by Arthur Borges on 23/12/23.
//

import SwiftUI

struct LogInView: View {
    @ObservedObject var viewModel: LogInViewModel
    
    @State var email = ""
    @State var password = ""
    
    @State var action: Int? = 0
    
    @State var navigationBarHidden = true
    
    var body: some View {
        NavigationView {
            
            ScrollView(showsIndicators: false){
                                    
                    Spacer(minLength: 150)
                    
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
                        
                        Text("Copyright @YYY")
                            .foregroundColor(Color.gray)
                            .font(Font.system(size: 16).bold())
                            .padding(.top, 16)
                        
                    }
                
            }.frame(maxWidth: .infinity,  maxHeight: .infinity)
                .padding(.horizontal, 25)
                .background(Color.white)
                .navigationBarTitle("Login", displayMode: .inline)
                .navigationBarHidden(navigationBarHidden)
        }
    }
}

extension LogInView {
    var emailField: some View {
        TextField(" Email", text: $email)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension LogInView {
    var passwordField: some View {
        SecureField("  Password", text: $password)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}
extension LogInView {
    var enterButton: some View {
        Button("Entrar") {
            // click event
        }
    }
}

extension LogInView {
    var registerLink: some View {
        
            ZStack {
                NavigationLink(
                    destination: Text("Sign Up screen"),
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
