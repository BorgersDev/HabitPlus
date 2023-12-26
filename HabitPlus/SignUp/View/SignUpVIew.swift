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
        TextField(" Full Name", text: $fullName)
            .border(Color.black)
    }
}

extension SignUpView {
    var emailField: some View {
        TextField(" Email", text: $email)
            .border(Color.black)
    }
}

extension SignUpView {
    var passwordField: some View {
        TextField(" Password", text: $password)
            .border(Color.black)
    }
}

extension SignUpView {
    var documentField: some View {
        TextField(" Document", text: $document)
            .border(Color.black)
    }
}

extension SignUpView {
    var phoneNumberField: some View {
        TextField(" Phone Number", text: $phoneNumber)
            .border(Color.black)
    }
}

extension SignUpView {
    var birthDateField: some View {
        TextField(" Birth date", text: $birthDate)
            .border(Color.black)
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
        Button("Register account") {
            viewModel.signUp()
        }
    }
}


#Preview {
    SignUpView(viewModel:SignUpViewModel())
}
