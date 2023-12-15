//
//  LoginView.swift
//  Threds
//
//  Created by Yuriy on 11.12.2023.
//

import SwiftUI

struct LoginView: View {
   
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                Image(systemName: "sun.max")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120,height: 120)
                    .padding()
                
                VStack {
                    TextField("Enter your email", text: $viewModel.email)
                        .modifier(ThredsTextFieldModifier())
                        .textInputAutocapitalization(.none)
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .modifier(ThredsTextFieldModifier())
                }
                
                NavigationLink {
                    Text("Forgot pass")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 28)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Button {
                    Task {
                        try await viewModel.loginUser()
                    }
                } label: {
                    Text("Login")
                        .modifier(ThredsButtonModifier())
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    RegistrationVIew()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Dont have account?")
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundColor(.black)
                }
                .padding(.vertical, 16)
                
            }
        }
    }
}

#Preview {
    LoginView()
}
