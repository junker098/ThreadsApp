//
//  ThredsButtonModifier.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ThredsButtonModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(width: 352, height: 44)
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .background(.black)
            .cornerRadius(8)
    }
}
