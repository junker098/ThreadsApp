//
//  RegistrationVIewModel.swift
//  Threds
//
//  Created by Yuriy on 15.12.2023.
//

import Foundation

class RegistrationViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullName = ""
    @Published var userName = ""
    
    @MainActor
    func createUser() async throws {
        print("DEBUG: Create user here...")
        try await AuthService.shared.createUser(withEmail: email,
                                                password: password,
                                                fullName: fullName,
                                                userName: userName
        )
    }
}
