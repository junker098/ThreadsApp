//
//  RegistrationVIew.swift
//  Threds
//
//  Created by Yuriy on 11.12.2023.
//

import SwiftUI

struct RegistrationVIew: View {
    
    @StateObject var viewModel = RegistrationViewModel()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
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
                
                SecureField("Enter your password", text: $viewModel.password)
                    .modifier(ThredsTextFieldModifier())
                
                TextField("Enter your fullname", text: $viewModel.fullName)
                    .modifier(ThredsTextFieldModifier())

                TextField("Enter your name", text: $viewModel.userName)
                    .modifier(ThredsTextFieldModifier())
                
                Button {
                    Task { try await viewModel.createUser() }
                } label: {
                    Text("Sign Up")
                        .modifier(ThredsButtonModifier())
                }
                .padding(.vertical)
            }
            Spacer()
            
            Divider()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 3) {
                    Text("Already have an account?")
                    Text("Sign in")
                        .fontWeight(.semibold)
                }
                .foregroundColor(.black)
                .font(.footnote)
            }
            .padding(.vertical, 16)

        }
    }
}

#Preview {
    RegistrationVIew()
}
