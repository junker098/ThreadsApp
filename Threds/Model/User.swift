//
//  User.swift
//  Threds
//
//  Created by Yuriy on 16.12.2023.
//

import Foundation

struct User: Identifiable, Codable, Hashable {
    let id: String
    let fullName: String
    let email: String
    let usename: String
    var profileImage: String?
    var bio: String?
}
