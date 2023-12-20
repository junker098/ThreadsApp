//
//  ThreadCreationViewModel.swift
//  Threds
//
//  Created by Yuriy on 20.12.2023.
//

import Foundation
import Firebase

class CreateThreeadViewModel: ObservableObject {
        
    func uploadThread(caption: String) async throws {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let thread = Thread(ownerUid: uid, caption: caption, timestamp: Timestamp(), likes: 0)
        try await ThreadService.uploadThread(thread)
    }
}
