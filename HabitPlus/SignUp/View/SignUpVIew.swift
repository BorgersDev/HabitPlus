//
//  SignUpVIew.swift
//  HabitPlus
//
//  Created by Arthur Borges on 24/12/23.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    
    
    var body: some View {
        
        ZStack {
            ScrollView (showsIndicators: false) {
                
                Spacer(minLength: 40)
                
                VStack (alignment: .leading, spacing: 12) {
                    Text("Sign Up")
                        .foregroundColor(.orange)
                        .font(.title.bold())
                        .padding(.bottom, 20)
                    
                    fullNameField
                    
                    emailField
                    
                    passwordField
                    
                    documentField
                    
                    phoneNumberField
                    
                    birthDateField
                                    
                    genderField
                    
                    enterButton
                }.padding(.horizontal, 40)
            }
            
            if case SignUpUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title:Text("Habit"), message:Text(value), dismissButton: .default(Text("Ok")) {
                            // happens after pressing "Ok"
                        })
                    }
            }
        }
        
    }
}
extension SignUpView {
    var fullNameField: some View {
        EditTextView(text: $viewModel.fullName,
                     placeholder: "Full Name",
                     keyboard: .alphabet,
                     error: "error",
                     failure: viewModel.fullName.count < 3
)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Invalid e-mail",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $viewModel.password,
                     placeholder: "Password",
                     keyboard: .emailAddress,
                     error: "Password should contain \n at least 8 characters",
                     failure: viewModel.password.count < 8)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $viewModel.document,
                     placeholder: "Document",
                     keyboard: .numberPad,
                     error: "Invalid Document",
                     failure: viewModel.document.count < 5)
    }
}

extension SignUpView {
    var phoneNumberField: some View {
        EditTextView(text: $viewModel.phoneNumber,
                     placeholder: "Phone Number",
                     keyboard: .phonePad,
                     error: "Invalid Phone number",
                     failure: viewModel.phoneNumber.count < 10 || viewModel.phoneNumber.count > 13)
    }
}

extension SignUpView {
    var birthDateField: some View {
        EditTextView(text: $viewModel.birthDate,
                     placeholder: "Birth Date",
                     keyboard: .default,
                     error: "MM/DD/YYYY",
                     failure: viewModel.birthDate.count != 10 )
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) {
                value in Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, 16)
            .padding(.bottom, 32)
    }
}

extension SignUpView {
    var enterButton: some View {
        LoadingButtonView(action: {
            viewModel.signUp()
        }, text: "Register account",showProgress: self.viewModel.uiState == SignUpUIState.loading, disabled: !viewModel.email.isEmail() || 
                          viewModel.password.count < 8 ||
                          viewModel.fullName.count < 3 ||
                          viewModel.phoneNumber.count < 10 ||
                          viewModel.phoneNumber.count > 13 ||
                          viewModel.birthDate.count != 10)
        
    }
}


#Preview {
    SignUpView(viewModel:SignUpViewModel())
}
