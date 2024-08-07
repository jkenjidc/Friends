//
//  ContentView.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//
import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query let users: [User]
    @State var loading = false
    var body: some View {
        NavigationStack{
            if loading {
                Spacer()
                ProgressView()
                    .navigationTitle("Friendster")
                    .frame(width: 100, height: 100)
                Spacer()
            } else {
                List(users){ user in
                    NavigationLink{
                        UserDetailView(user: user)
                    } label: {
                        UserCardView(user: user)
                    }
                }
                .navigationTitle("Friendster")
            }
        }
        .onAppear{
            if users.isEmpty {
                loading = true
                Task{
//                    try await UserViewModel().fetchUsers(modelContext: modelContext)
                    try await fetchUsers()
                }
            }
        }
    }
    
    func fetchUsers() async throws{
//        try await UserViewModel().fetchUsers(modelContext: modelContext)
//        try await Task.sleep(nanoseconds: 1 * UInt64(1e9))
//        loading = false
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
            try await Task.sleep(nanoseconds: 1 * UInt64(1e9))
            loading = false
            
        } catch {
            print(error)
        }
        
        
    }
}

#Preview {
    ContentView()
}
