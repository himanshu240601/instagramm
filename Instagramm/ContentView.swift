//
//  ContentView.swift
//  Instagramm
//
//  Created by Himanshu's MacBook on 08/06/24.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @StateObject private var signInVM = SignInViewModel()
    
    /// focus email state
    @FocusState var isEmailFieldFocused: Bool
    /// focus password state
    @FocusState var isPasswordFieldFocused: Bool
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // language selection
            Text("English (US)")
                .font(.system(size: 12))
                .fontWeight(.light)
                .opacity(0.8)
                .padding(.top)
            
            // app icon
            Image("Instagram")
                .resizable()
                .frame(width: 64, height: 64)
                .padding(.vertical, 74)
            
            VStack(spacing: 14) {
                // username, email or phone text field
                TextField("", text: $signInVM.email)
                    .focused($isEmailFieldFocused)
                    .accentColor(.primary)
                    .overlay(alignment: .leading) {
                        // placeholder text
                        Text("Username, email address or mobile number")
                            .font(.system(size: signInVM.isEmailFieldFocusedOrFilled(isEmailFieldFocused) ? 12 : 14))
                            .foregroundStyle(.primary.opacity(signInVM.isEmailFieldFocusedOrFilled(isEmailFieldFocused) ? 0.5 : 0.25))
                            .padding(.top, signInVM.isEmailFieldFocusedOrFilled(isEmailFieldFocused) ? -26 : -8)
                    }
                    .onTapGesture {
                        // focus email text field
                        withAnimation {
                            isEmailFieldFocused.toggle()
                        }
                    }
                    .padding()
                    .padding(.top, 12)
                    .padding(.bottom, 4)
                    .padding(.trailing, 34)
                    .font(.system(size: 14))
                    .fontWeight(.medium)
                    .background(.white)
                    .cornerRadius(12)
                    .overlay {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .stroke(lineWidth: 1)
                            .foregroundStyle(.gray.opacity(isEmailFieldFocused ? 1 : 0.5))
                    }
                    .overlay(alignment: .trailing) {
                        // clear email text field button
                        if isEmailFieldFocused && !signInVM.email.isEmpty {
                            Button {
                                signInVM.email = ""
                            } label: {
                                Image("CloseIcon")
                                    .resizable()
                                    .frame(width: 24, height: 24)
                            }
                            .padding()
                            .foregroundStyle(.gray)
                        }
                    }
                
                // password text field
                ZStack {
                    Group {
                        // visible password text field (visible on show password)
                        TextField("", text: $signInVM.password)
                            .focused($isPasswordFieldFocused)
                            .accentColor(.primary)
                            .overlay(alignment: .leading) {
                                // placeholder text
                                Text("Password")
                                    .font(.system(size: signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? 12 : 14))
                                    .foregroundStyle(.primary.opacity(signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? 0.5 : 0.25))
                                    .padding(.top, signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? -26 : -8)
                            }
                            .padding()
                            .padding(.top, 12)
                            .padding(.bottom, 4)
                            .padding(.trailing, 34)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay(alignment: .trailing) {
                                // toggle password button
                                if !signInVM.password.isEmpty {
                                    Button {
                                        signInVM.isPasswordVisible.toggle()
                                    } label: {
                                        Image(signInVM.isPasswordVisible ? "HidePasswordIcon" : "ShowPasswordIcon")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding()
                                    .foregroundStyle(.gray)
                                }
                            }
                        
                        // secure password text field (default or secure password entry)
                        SecureField("", text: $signInVM.password)
                            .focused($isPasswordFieldFocused)
                            .accentColor(.primary)
                            .overlay(alignment: .leading) {
                                // placeholder text
                                Text("Password")
                                    .font(.system(size: signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? 12 : 14))
                                    .foregroundStyle(.primary.opacity(signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? 0.5 : 0.25))
                                    .padding(.top, signInVM.isPasswordFieldFocusedOrFilled(isPasswordFieldFocused) ? -26 : -8)
                            }
                            .padding()
                            .padding(.top, 12)
                            .padding(.bottom, 4)
                            .padding(.trailing, 34)
                            .font(.system(size: 14))
                            .fontWeight(.medium)
                            .background(.white)
                            .cornerRadius(12)
                            .overlay {
                                RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                                    .stroke(lineWidth: 1)
                                    .foregroundStyle(.gray.opacity(isPasswordFieldFocused ? 1 : 0.5))
                            }
                            .overlay(alignment: .trailing) {
                                // toggle password button
                                if !signInVM.password.isEmpty {
                                    Button {
                                        signInVM.isPasswordVisible.toggle()
                                    } label: {
                                        Image(signInVM.isPasswordVisible ? "HidePasswordIcon" : "ShowPasswordIcon")
                                            .resizable()
                                            .frame(width: 24, height: 24)
                                    }
                                    .padding()
                                    .foregroundStyle(.gray)
                                }
                            }
                            .onTapGesture {
                                // focus password text field
                                withAnimation {
                                    isPasswordFieldFocused.toggle()
                                }
                            }
                            .opacity(signInVM.isPasswordVisible ? 0 : 1)
                    }
                }
                
                // login button
                Button(action: {
                    // login in user
                }, label: {
                    Text("Log in")
                        .frame(maxWidth: .infinity)
                })
                .padding()
                .background(Color("AppPrimaryColor"))
                .foregroundStyle(.white)
                .font(.system(size: 15))
                .fontWeight(.medium)
                .cornerRadius(100)
            }
            
            // forgot password button
            Button(action: {
                // forgot password
            }, label: {
                Text("Forgotten Password?")
            })
            .foregroundStyle(.primary.opacity(0.7))
            .font(.system(size: 15))
            .padding()
            
            Spacer()
            
            // create new account button
            Button(action: {
                // login in user
            }, label: {
                Text("Create New Account")
                    .frame(maxWidth: .infinity)
            })
            .padding()
            .foregroundStyle(Color("AppPrimaryColor"))
            .font(.system(size: 15))
            .fontWeight(.medium)
            .cornerRadius(100)
            .overlay {
                RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
                    .stroke(lineWidth: 1)
                    .foregroundStyle(Color("AppPrimaryColor"))
            }
            .padding(.vertical)
            
        }
        .padding()
        .background(.linearGradient(colors: [.yellow.opacity(0.1), .pink.opacity(0.01), .blue.opacity(0.1), .blue.opacity(0.1), .blue.opacity(0.1)], startPoint: .topLeading, endPoint: .trailing))
        .onTapGesture {
            // hide keyboard on outside click
            UIApplication.shared.endEditing()
        }
    }
}

#Preview {
    ContentView()
}
