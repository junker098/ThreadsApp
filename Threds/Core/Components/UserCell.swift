//
//  UserCell.swift
//  Threds
//
//  Created by Yuriy on 13.12.2023.
//

import SwiftUI

struct UserCell: View {
    
    let user: User
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView(user: user, size: .small)
                
                VStack(alignment: .leading, spacing: 2){
                    Text(user.usename)
                        .fontWeight(.semibold)
                    Text(user.fullName)
                }
                .font(.footnote)
                
                Spacer()
                
                Text("Follow")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 100, height: 32)
                    .overlay {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    UserCell(user: User.placeholder)
}
