//
//  UserCardView.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import SwiftUI

struct UserCardView: View {
    public let user: User
    var body: some View {
        HStack{
            Image(systemName: "person.circle")
                .frame(width: 10, height: 10)
                .foregroundStyle(user.isActive ? .green : .red)
                .padding(.bottom, 23)
                .padding(.trailing, 10)
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.system(size: 20))
                    .fontWeight(.medium)
                Text(user.company)
                    .fontWeight(.semibold)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 15)
    }
}

#Preview {
    let user = User(id: "34434", isActive: true, name: "Kenji Dc", age: 24, company: "WT", email: "WT@G", address: "WTTT", about: "TTT", registered: .now, tags: [], friends: [])
    return UserCardView(user: user)
}
