//
//  UserContentListVIewModel.swift
//  Threds
//
//  Created by Yuriy on 20.12.2023.
//

import Foundation

class UserContentListVIewModel: ObservableObject {
    @Published var threads = [Thread]()
    
    let user: User
    
    init(user: User) {
        self.user = user
        Task {
           try await fetchUserThreads()
        }
    }
    
    @MainActor
    func fetchUserThreads() async throws {
        var threads = try await ThreadService.fetchUserThreads(uid: user.id)
        
        for i in 0..<threads.count {
            threads[i].user = self.user
        }
        
        self.threads = threads
    }
}
