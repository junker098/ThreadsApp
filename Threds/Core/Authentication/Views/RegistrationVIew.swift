//
//  RegistrationVIew.swift
//  Threds
//
//  Created by Yuriy on 11.12.2023.
//

import SwiftUI

struct RegistrationVIew: View {
    @State private var email = ""
    @State private var password = ""
    @State private var fullName = ""
    @State private var userName = ""
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
                TextField("Enter your email", text: $email)
                    .modifier(ThredsTextFieldModifier())
                
                SecureField("Enter your password", text: $password)
                    .modifier(ThredsTextFieldModifier())
                
                TextField("Enter your email", text: $fullName)
                    .modifier(ThredsTextFieldModifier())

                
                TextField("Enter your email", text: $userName)
                    .modifier(ThredsTextFieldModifier())
                
                Button {
                    
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
