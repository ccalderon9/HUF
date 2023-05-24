//
//  TabsView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct TabsView: View {
    
    @StateObject var navigationRouter: NavigationRouter = NavigationRouter()
    
    @State private var selectedTab: Tab = .home
    
    enum Tab {
        case home, shop, favorites, bag, profile
    }
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView()
                .tabItem(imageName: "house", title: "Home")
                .tag(Tab.home)
                .environmentObject(navigationRouter)
            
            ShopView()
                .tabItem(imageName: "magnifyingglass", title: "Shop")
                .tag(Tab.shop)
                .environmentObject(navigationRouter)
            
            FavoritesView()
                .tabItem(imageName: "heart", title: "Favorites")
                .tag(Tab.favorites)
                .environmentObject(navigationRouter)
            
            BagView()
                .tabItem(imageName: "bag", title: "Bag")
                .tag(Tab.bag)
                .environmentObject(navigationRouter)
            
//            ProfileView()
//                .tabItem(imageName: "person", title: "Profile")
//                .tag(Tab.home)
//                .environmentObject(navigationRouter)
        }
    }
}

struct TabsView_Previews: PreviewProvider {
    static var previews: some View {
        TabsView()
    }
}

extension View {
    @ViewBuilder
    func tabItem(imageName: String, title: String) -> some View {
        self.tabItem {
            HStack(spacing: 6) {
                Image(systemName: imageName)
                Text(title)
            }
        }
    }
}
