//
//  ProfileView.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ProfileView: View {
    let user: User
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            //bio and stats
            VStack(spacing: 20) {
                ProfileHeaderView(user: user)
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .frame(width: 352, height: 32)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color(.black))
                        .cornerRadius(8)
                }
                
                //user content list view
                UserContentListView()
            }
        }
        .padding(.horizontal)
        .navigationBarTitleDisplayMode(.inline)
        
    }
}

#Preview {
    ProfileView(user: User.placeholder)
}
