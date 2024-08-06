//
//  ContentView.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import SwiftUI

struct ContentView: View {
    var model = UserViewModel()
    var body: some View {
        NavigationStack{
            List{
                ForEach(model.users, id: \.self){ user in
                    NavigationLink{
                        UserDetailView(user: user)
                    } label: {
                        UserCardView(user: user)
                    }
                }
            }
            .navigationTitle("Friendster")
        }
        .onAppear{
            if model.users.isEmpty {
                Task{
                    await model.fetchUsers()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
