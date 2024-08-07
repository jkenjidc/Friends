//
//  FriendsApp.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import SwiftUI
import SwiftData

@main
struct FriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
