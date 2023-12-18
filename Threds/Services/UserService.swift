//
//  UserService.swift
//  Threds
//
//  Created by Yuriy on 18.12.2023.
//

import Firebase
import FirebaseFirestoreSwift

class UserService {
    
    @Published var currentuser: User?
    
    static let shared = UserService()
    
    init() {
        Task { try await fetchCurrentUser()  }
    }
    
    @MainActor
    func fetchCurrentUser() async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        let snapshot = try await Firestore.firestore().collection("users").document(uid).getDocument()
        let user = try snapshot.data(as: User.self)
        self.currentuser = user
        
        print("DEBUG: User is \(user)")
    }
}
