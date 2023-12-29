//
//  CustomTextFieldStyle.swift
//  HabitPlus
//
//  Created by Arthur Borges on 27/12/23.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 8)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 10.0)
                    .stroke(Color.orange, lineWidth: 0.8)
            )
            .disableAutocorrection(true)
            .autocapitalization(.none)

    }
    
}
