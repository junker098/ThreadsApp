//
//  CircularProfileImageView.swift
//  Threds
//
//  Created by Yuriy on 13.12.2023.
//

import SwiftUI

struct CircularProfileImageView: View {
    var body: some View {
        Image("profileImage")
            .resizable()
            .scaledToFill()
            .frame(width: 40, height: 40)
            .clipShape(Circle())
    }
}

#Preview {
    CircularProfileImageView()
}
