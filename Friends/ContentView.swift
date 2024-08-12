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
    @Query(sort: [SortDescriptor(\User.name)]) let users: [User]
    @State var loading = false
    var body: some View {
        Button("delete"){
            users.forEach {
                modelContext.delete($0)
            }
        }
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
                    try await UserViewModel().fetchUsers(modelContext: modelContext)
                }
                loading = false
            }
            print(users.count)
        }
    }
    
}

#Preview {
    ContentView()
}
