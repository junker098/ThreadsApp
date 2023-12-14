//
//  ThredsTextFieldModifier.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ThredsTextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(12)
            .font(.subheadline)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .padding(.horizontal, 24)
    }
}
