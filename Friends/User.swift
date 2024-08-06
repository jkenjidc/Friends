//
//  File.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import Foundation
import SwiftData
// MARK: - WelcomeElement

struct User: Codable, Hashable {
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company, email, address, about: String
    var registered: Date
    var tags: [String]
    var friends: [Friend]
    
}

// MARK: - Friend
struct Friend: Codable, Hashable {
    var id, name: String
}

