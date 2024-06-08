//
//  SignInViewModel.swift
//  Instagramm
//
//  Created by Himanshu's MacBook on 08/06/24.
//

import SwiftUI

class SignInViewModel: ObservableObject {
    
    // MARK: - Properties
    
    // Login Page
    
    /// store email, username or phone number
    @Published var email: String = ""
    /// store password
    @Published var password: String = ""
    
    /// boolean to toggle for password
    @Published var isPasswordVisible: Bool = false
    
    /// open forgot password view
    @Published var openForgotPassword: Bool = false
    /// open create  account view
    @Published var openCreateAccount: Bool = false
    
    // MARK: - Methods
    
    func isEmailFieldFocusedOrFilled(_ isFocused: Bool) -> Bool {
        return isFocused || !email.isEmpty
    }
    
    func isPasswordFieldFocusedOrFilled(_ isFocused: Bool) -> Bool {
        return isFocused || !password.isEmpty
    }
}
