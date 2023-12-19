//
//  ThreadsTabBar.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ThreadsTabBar: View {
    
    @State private var selectedTab = 0
    @State private var showCreateThread = false
    
    var body: some View {
        
        TabView(selection: $selectedTab,
                content:  {
            FeedView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                       .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear(perform: { selectedTab = 0 })
                .tag(0)
            
            ExploreView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                }
                .onAppear(perform: { selectedTab = 1 })
                .tag(1)
            
            Text("")
                .tabItem {
                    Image(systemName: "plus")
                }
                .onAppear(perform: { selectedTab = 2 })
                .tag(2)
            
            ActivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "heart.fill" : "heart")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear(perform: { selectedTab = 3 })
                .tag(3)
            
            CurrentUserProfileView()
                .tabItem {
                    Image(systemName: selectedTab == 4 ? "person.fill" : "person")
                        .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                }
                .onAppear(perform: { selectedTab = 4 })
                .tag(4)
        })
        
        .onChange(of: selectedTab, {
            showCreateThread = selectedTab == 2
        })
        .sheet(isPresented: $showCreateThread, onDismiss: {
            selectedTab = 0
        }, content: {
            CreateThreadView()
        })
        .tint(.black)
    }
}

#Preview {
    ThreadsTabBar()
}
