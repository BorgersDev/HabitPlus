//
//  SignUpViewModel.swift
//  HabitPlus
//
//  Created by Arthur Borges on 25/12/23.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phoneNumber = ""
    @Published var birthDate = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUIState = .none
    
    func signUp() {
        self.uiState = .loading
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_SUS_POSIX")
        formatter.dateFormat = "MM/dd/yyyy"
        
        let dateFormatted = formatter.date(from: birthDate)
        
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("\(birthDate) Invalid Date")
            return
        }
        
        formatter.dateFormat = "yyy-MM-dd"
        let birthDate = formatter.string(from: dateFormatted)
        
        
        
        WebService.postUser(request: SignUpRequest(fullName: fullName,
                                                   email: email,
                                                   password: password,
                                                   document: document,
                                                   phoneNumber: phoneNumber,
                                                   birthDate: birthDate,
                                                   gender: gender.index))
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
////              self.uiState = .error("Email already used")
//            self.uiState = .sucess
//            self.publisher.send(true)
//        }
    }
}


extension SignUpViewModel {
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
}
