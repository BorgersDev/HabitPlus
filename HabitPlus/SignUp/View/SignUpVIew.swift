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
    @State var gender = Gender.male
    
    @ObservedObject var viewModel: SignUpViewModel
    
    
    
    var body: some View {
        
        ZStack {
            ScrollView (showsIndicators: false) {
                
                Spacer(minLength: 75)
                
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
        EditTextView(text: $fullName,
                     placeholder: "Full Name",
                     keyboard: .alphabet,
                     error: "error",
                     failure: fullName.count < 3
)
    }
}

extension SignUpView {
    var emailField: some View {
        EditTextView(text: $email,
                     placeholder: "E-mail",
                     keyboard: .emailAddress,
                     error: "Invalid e-mail",
                     failure: !email.isEmail())
    }
}

extension SignUpView {
    var passwordField: some View {
        EditTextView(text: $password,
                     placeholder: "Password",
                     keyboard: .emailAddress,
                     error: "Password should contain \n at least 8 characters",
                     failure: password.count < 8)
    }
}

extension SignUpView {
    var documentField: some View {
        EditTextView(text: $document,
                     placeholder: "Document",
                     keyboard: .numberPad,
                     error: "Invalid Document",
                     failure: document.count < 5)
    }
}

extension SignUpView {
    var phoneNumberField: some View {
        EditTextView(text: $phoneNumber,
                     placeholder: "Phone Number",
                     keyboard: .phonePad,
                     error: "Invalid Phone number",
                     failure: phoneNumber.count < 10 || phoneNumber.count > 13)
    }
}

extension SignUpView {
    var birthDateField: some View {
        EditTextView(text: $birthDate,
                     placeholder: "Birth Date",
                     keyboard: .default,
                     error: "mm/dd/yyyy",
                     failure: birthDate.count != 10 )
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $gender) {
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
        }, text: "Register account",showProgress: self.viewModel.uiState == SignUpUIState.loading, disabled: !email.isEmail() || 
                          password.count < 8 ||
                          fullName.count < 3 ||
                          phoneNumber.count < 10 ||
                          phoneNumber.count > 13 ||
                          birthDate.count != 10)
        
    }
}


#Preview {
    SignUpView(viewModel:SignUpViewModel())
}
