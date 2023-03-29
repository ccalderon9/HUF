//
//  HomeView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct HomeView: View {
    
    let colors: [Color] = [Color.green, Color.brown, Color.yellow]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass")
                }
                .padding(16)
                
                Text("FREE US DELIVERY ON ORDERS $75+")
                    .frame(idealWidth: .infinity, maxWidth: .infinity, minHeight: 48)
                    .background(.gray)
                
                ZStack {
                    TabView {
                        ForEach(colors, id: \.hashValue) { color in
                            Rectangle()
                                .foregroundColor(color)
                                .frame(height: 450)
                        }
                    }
                    .tabViewStyle(.page(indexDisplayMode: .always))
                    
                    VStack {
                        Spacer()
                        
                        HStack {
                            Button {
                                
                            } label: {
                                Text("Shop")
                            }
                            .buttonStyle(PrimaryButtonStyle())
                            .frame(width: 114)
                            .padding(.bottom, 60)
                            
                            Spacer()
                        }
                        .padding(.horizontal, 16)
                    }
                }
                .frame(height: 450)
                .padding(.bottom, 40)
                
                HStack {
                    Text("Top Picks for you")
                        .font(.title3)
                    Spacer()
                }
                .padding(.horizontal, 16)
                .padding(.bottom, 16)
                
                ScrollView(.horizontal, showsIndicators: true) {
                    HStack(spacing: 16) {
                        ForEach(colors, id: \.hashValue) { color in
                            RoundedRectangle(cornerRadius: 16)
                                .foregroundColor(color)
                                .frame(width: 250, height: 250)
                        }
                    }
                }
                .padding(.leading, 16)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 14 Pro Max")
    }
}
