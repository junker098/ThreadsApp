//
//  ProfileHeaderView.swift
//  Threds
//
//  Created by Yuriy on 18.12.2023.
//

import SwiftUI

struct ProfileHeaderView: View {
    
    var user: User?
    
    init(user: User?) {
        self.user = user
    }
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading ,spacing:  12) {
                VStack(alignment:.leading, spacing: 4) {
                    //fullname and username
                    Text(user?.fullName ?? "")
                        .font(.title2)
                        .fontWeight(.semibold)
                    Text(user?.usename ?? "")
                        .font(.subheadline)
                }
                
                if let bio = user?.bio {
                    Text(bio)
                        .font(.footnote)
                }
                
                Text("2 followers")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            Spacer()
            
            CircularProfileImageView(user: user, size: .medium)
        }    }
}

#Preview {
    ProfileHeaderView(user: User.placeholder)
}
