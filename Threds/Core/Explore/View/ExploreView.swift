//
//  ExploreView.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var serchText = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(0...10, id: \.self) { threds in
                        UserCell()
                        Divider()
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationTitle("Search")
            .searchable(text: $serchText, prompt: "Search")
        }
    }
}


#Preview {
    ExploreView()
}
