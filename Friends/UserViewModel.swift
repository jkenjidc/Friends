//
//  UserViewModel.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import Foundation

@Observable
class UserViewModel {
   var users = [User]()
    
    func fetchUsers() async {
        let defaults = UserDefaults.standard
        if let savedActivities = defaults.object(forKey: "savedUsers") as? Data {
            let decoder = JSONDecoder()
            if let loadedActivities = try? decoder.decode([User].self, from: savedActivities) {
                self.users = loadedActivities
            }
        } else {
            guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")
            else {
                print("Invalid URL")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let decodedResponse = try? decoder.decode([User].self, from: data) {
                    self.users = decodedResponse
                    let userDefaults = UserDefaults.standard
                    if let contentData = try? JSONEncoder().encode(self.users) {
                        userDefaults.set(contentData, forKey: "savedUsers")
                    }
                }
                
            } catch {
                print("invalid response")
            }
        }
    }
}
