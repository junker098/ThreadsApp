//
//  PreviewProvider.swift
//  Threds
//
//  Created by Yuriy on 18.12.2023.
//

import SwiftUI
import Firebase

extension PreviewProvider { //not woorking with new macros
    static var dev: DeveloperPreview {
        return DeveloperPreview.shared
    }
}

class DeveloperPreview { //For preview
    static let shared = DeveloperPreview()
    
    let user = User(id: NSUUID().uuidString, fullName: "Yuriy Mogorita", email: "yuriy@gmail.com", usename: "yuriyMogorita")
}

extension User {  //For preview #2
    static let placeholder = User(id: NSUUID().uuidString, fullName: "Yuriy Mogorita", email: "yuriy@gmail.com", usename: "yuriyMogorita")
}

extension Thread {
    static let placeholder = Thread(ownerUid: "123", caption: "Test threads", timestamp: Timestamp(), likes: 0)
}
