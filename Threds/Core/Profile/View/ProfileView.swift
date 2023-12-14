//
//  ProfileView.swift
//  Threds
//
//  Created by Yuriy on 12.12.2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State private var selectedFilter: ProfileThreadsFilter = .threads
    @Namespace private var animation
    private var rectangleWidth: CGFloat {
        let count = CGFloat(ProfileThreadsFilter.allCases.count)
        return UIScreen.main.bounds.width / count - 16
    }
    
    var body: some View {
        
        
        ScrollView(showsIndicators: false) {
            //bio and stats
            VStack(spacing: 20) {
                HStack(alignment: .top) {
                    VStack(alignment: .leading ,spacing:  12) {
                        VStack(alignment:.leading, spacing: 4) {
                            //fullname and username
                            Text("Charles Leclerc")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Text("Surname")
                                .font(.subheadline)
                        }
                        
                        Text("Formula driven")
                            .font(.footnote)
                        
                        Text("2 followers")
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                    Spacer()
                    
                    CircularProfileImageView()
                }
                
                Button {
                    
                } label: {
                    Text("Follow")
                        .frame(width: 352, height: 32)
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .background(Color(.black))
                        .cornerRadius(8)
                }
                
                //user content list view
                
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
                        ForEach(0...10, id: \.self) { thread in
                            ThreadCell()
                        }
                    }
                }
                .padding(.vertical, 8)

            }
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ProfileView()
}
