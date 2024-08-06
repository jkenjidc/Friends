//
//  UserDetailView.swift
//  Friends
//
//  Created by Kenji Dela Cruz on 8/6/24.
//

import SwiftUI

struct UserDetailView: View {
    public let user: User
    var body: some View {
        ScrollView{
            VStack(alignment: .leading){
                HeaderView(user: user)
                AboutView(about: user.about)
                FriendList(friends: user.friends)
            }
            .navigationTitle(user.name)
        }
        .scrollBounceBehavior(.basedOnSize)
        Spacer()
    }
    
}
struct HeaderView: View {
    public let user: User
    var body: some View {
        return VStack{
            HStack(alignment: .top){
            VStack{
                Image(systemName: "person.crop.square.fill")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .foregroundStyle(.secondary)
            }
            VStack(alignment: .leading){
                Text(user.name)
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .padding(.top, 20)
                    .padding(.bottom, 2)
                Text("\(String(user.age)) years old")
                Text(user.address)
                    .foregroundStyle(.secondary)
                
                
            }
            Spacer()
        }
        .padding(.horizontal, 20)
        .padding(.top, 20)
        Text(user.email)
            .font(.system(size: 15))
            .padding(.leading, 20)}
        }

    
}
struct AboutView: View {
    public let about: String
    var body: some View{
        return Text(about)
            .font(.title3)
            .padding(10)
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.secondary, lineWidth: 3)
            )
            .padding(.horizontal, 20)
    }

    
}
struct FriendList: View {
    public let friends: [Friend]
    var body: some View {
        VStack(alignment: .leading) {
            if !friends.isEmpty {
                Text("Friends")
                    .font(.system(size: 45))
                    .bold()
                    .padding(.leading, 20)
                    .padding(.bottom, -5)
                ForEach(friends, id: \.self){ friend in
                    Text(friend.name)
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 20))
                        .bold()
                        .foregroundStyle(.white)
                        .padding(.top, 30)
                        .padding(.bottom, 30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(.secondary, lineWidth: 3)
                        )
                        .background(.gray)
                        .cornerRadius(20)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 8)
                        
                }
                
            }
        }
    }
    
}

#Preview {
    let user = User(id: "34434", isActive: true, name: "Boyer Nieves", age: 24, company: "Comverges", email: "boyernieves@comverges.com", address: "753 Georgia Avenue, Cataract, American Samoa, 8097", about: " Cillum incididunt consequat commodo deserunt nulla voluptate. Labore nisi aliqua exercitation sint ut tempor sint laborum aliquip incididunt. Elit do commodo deserunt labore ea tempor fugiat. Aliqua culpa sunt esse duis l.", registered: .now, tags: [], friends: [Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Gill Hobbs"),Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Gill Hobbs"),Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Gill Hobbs"),Friend(id: "22934d37-6bbd-4023-b99b-88819eeee0da", name: "Gill Hobbs") ])
//    let user = User(id: "34434", isActive: true, name: "Boyer Nieves", age: 24, company: "Comverges", email: "boyernieves@comverges.com", address: "753 Georgia Avenue, Cataract, American Samoa, 8097", about: " Cillum incididunt consequat commodo deserunt nulla voluptate. Labore nisi aliqua exercitation sint ut tempor sint laborum aliquip incididunt. Elit do commodo deserunt labore ea tempor fugiat. Aliqua culpa sunt esse duis l.", registered: .now, tags: [], friends: [])
    return UserDetailView(user: user)
}
