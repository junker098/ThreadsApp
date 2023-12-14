//
//  ProfileThreadsFilter.swift
//  Threds
//
//  Created by Yuriy on 14.12.2023.
//

import Foundation

enum ProfileThreadsFilter: Int, CaseIterable, Identifiable {
   
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int {
        self.rawValue
    }
}
