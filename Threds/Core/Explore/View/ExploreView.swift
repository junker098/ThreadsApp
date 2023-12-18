//
//  ExploreView.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ExploreView: View {
    
    @State private var serchText = ""
    @StateObject var viewModel = ExploreViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.users) { user in
                        NavigationLink(value: user) {
                            UserCell(user: user)
                            Divider()
                        }
                    }
                    .padding(.vertical, 4)
                }
            }
            .navigationDestination(for: User.self, destination: { user in
                ProfileView()
            })
            .navigationTitle("Search")
            .searchable(text: $serchText, prompt: "Search")
        }
    }
}


#Preview {
    ExploreView()
}
