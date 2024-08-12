//
//  UserViewModel.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import Foundation
import SwiftUI
import SwiftData

@MainActor
struct UserViewModel {
    
    func fetchUsers(modelContext: ModelContext) async throws{
        
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
        else {
            print("Invalid URL")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedResponse = try decoder.decode([User].self, from: data)
            decodedResponse.forEach { modelContext.insert($0)}
            
        } catch {
            print(error)
        }
        
    }
    
}
