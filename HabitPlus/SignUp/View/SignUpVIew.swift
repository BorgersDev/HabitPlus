//
//  SignUpVIew.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import SwiftUI

struct SignUpView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var document = ""
    @State var phoneNumber = ""
    @State var birthDate = ""
    
    
    
    
    
    
    var body: some View {
        
        ScrollView (showsIndicators: false) {
            
            Spacer(minLength: 100)
            
            VStack (alignment: .center, spacing: 12) {
                Text("Sign Up")
                    .foregroundColor(.orange)
                    .font(.title)
                    .padding(.bottom, 20)
                
                fullNameField
                
                emailField
                
                passwordField
                
                documentField
                
                phoneNumberField
                
                birthDateField
                
                enterButton
            }
        }
    }
}
extension SignUpView {
    var fullNameField: some View {
        TextField(" Full Name", text: $fullName)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var emailField: some View {
        TextField(" Email", text: $email)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var passwordField: some View {
        SecureField(" Password", text: $password)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var documentField: some View {
        TextField(" Document", text: $document)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var phoneNumberField: some View {
        TextField(" Phone Number", text: $phoneNumber)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var birthDateField: some View {
        TextField(" Birth date", text: $birthDate)
            .border(Color.black)
            .padding(.horizontal, 33)
    }
}

extension SignUpView {
    var enterButton: some View {
        Button("Register account") {
//            viewModel.login(email: email, password: password)
        }
    }
}


#Preview {
    SignUpView()
}
