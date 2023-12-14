//
//  UserCell.swift
//  Threds
//
//  Created by Yuriy on 13.12.2023.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        VStack {
            HStack {
                CircularProfileImageView()
                
                VStack(alignment: .leading){
                    Text("Title")
                        .fontWeight(.semibold)
                    Text("Description")
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
    UserCell()
}
