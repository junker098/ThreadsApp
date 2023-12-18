//
//  AuthService.swift
//  Threds
//
//  Created by Yuriy on 15.12.2023.
//

import Firebase
import FirebaseFirestoreSwift

class AuthService {
    
    static let shared = AuthService()
    
    @Published var userSession: FirebaseAuth.User?
    
    init() {
        self.userSession = Auth.auth().currentUser
    }
    
    @MainActor
    func login(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            userSession = result.user
            try await UserService.shared.fetchCurrentUser()
        } catch {
            print("DEBUG: Failed signIn user with error \(error.localizedDescription)")
        }
    }
    
    @MainActor
    func createUser(withEmail email: String, password: String, fullName: String, userName: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            userSession = result.user
            try await uploadUserData(withEmail: email, fullName: fullName, userName: userName, id: result.user.uid)
        } catch {
            print("DEBUG: Failed create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        try? Auth.auth().signOut() // signOut on backEnd side
        self.userSession = nil // removes session localy and update routing
        UserService.shared.resetUser()
    }
    
    @MainActor
    private func uploadUserData(withEmail email: String, 
                                fullName: String,
                                userName: String,
                                id: String
    ) async throws {
        let user = User(id: id, fullName: fullName, email: email, usename: userName)
        guard let userData = try? Firestore.Encoder().encode(user) else { return }
        try await Firestore.firestore().collection("users").document(id).setData(userData)
        UserService.shared.currentuser = user
    }
}
