//
//  ContentView.swift
//  Threds
//
//  Created by Yuriy on 11.12.2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ThreadsTabBar()
            } else {
                LoginView()
            }
        }
    }
    
}

#Preview {
    ContentView()
}
