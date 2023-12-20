//
//  UserContentListView.swift
//  Threds
//
//  Created by Yuriy on 19.12.2023.
//

import SwiftUI

struct UserContentListView: View {
    
    @StateObject var viewModel: UserContentListVIewModel
    @State private var selectedFilter: ProfileThreadsFilter = .threads
    @Namespace private var animation
    
    private var rectangleWidth: CGFloat {
        let count = CGFloat(ProfileThreadsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    init(user: User) {
        self._viewModel = StateObject(wrappedValue: UserContentListVIewModel(user: user))
    }
    
    var body: some View {
        VStack {
            HStack {
                ForEach(ProfileThreadsFilter.allCases) { filter in
                    VStack {
                        Text(filter.title)
                            .font(.subheadline)
                            .fontWeight(selectedFilter == filter ? .semibold : .regular)
                        if selectedFilter == filter {
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width: rectangleWidth, height: 1)
                                .matchedGeometryEffect(id: "item", in: animation)
                        } else {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: rectangleWidth, height: 1 )
                        }
                    }
                    .onTapGesture {
                        withAnimation(.spring) {
                            selectedFilter = filter
                        }
                    }
                }
            }
            
            LazyVStack {
                ForEach(viewModel.threads) { thread in
                    ThreadCell(thread: thread)
                }
            }
        }
        .padding(.vertical, 8)

    }
}

#Preview {
    UserContentListView(user: User.placeholder)
}
