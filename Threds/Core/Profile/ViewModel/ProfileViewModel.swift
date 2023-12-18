//
//  ProfileViewModel.swift
//  Threds
//
//  Created by Yuriy on 18.12.2023.
//

import Combine

class ProfileViewModel: ObservableObject {
    
    @Published var currentUser: User?
    private var cancelables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentuser.sink { [weak self] user in
            self?.currentUser = user
            print("DEBUG: User in VM from combine \(user)")
        }.store(in: &cancelables)
    }
}
