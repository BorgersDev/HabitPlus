//
//  LoadingButtonView.swift
//  HabitPlus
//
//  Created by Arthur Borges on 28/12/23.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var showProgress: Bool = false
    var disabled: Bool = false
    
    var body: some View {
        ZStack{
            Button(action: {
                action()
            }, label: {
                Text(showProgress ? "" : text)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 14)
                    .padding(.horizontal, 16)
                    .font(.title3.bold())
                    .background(disabled ? Color("lightOrange") : Color(.orange))
                    .foregroundColor(.white)
                    .cornerRadius(4.0)
                
            }).disabled(disabled || showProgress)
            
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }
    }
}

#Preview {
    LoadingButtonView(action:{
        print("Hello,World")
    },text: "Log In", showProgress: false, disabled: false)
}
#Preview {
    LoadingButtonView(action:{
        print("Hello,World")
    },text: "Log In", showProgress: true, disabled: true)
    .preferredColorScheme(.dark)
}
