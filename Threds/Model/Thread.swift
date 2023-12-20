//
//  Thread.swift
//  Threds
//
//  Created by Yuriy on 20.12.2023.
//

import Firebase
import FirebaseFirestoreSwift

struct Thread: Identifiable, Codable {
    @DocumentID var threadid: String?
    let ownerUid: String
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    
    var id: String {
        threadid ?? NSUUID().uuidString
    }
    
    var user: User?
}
