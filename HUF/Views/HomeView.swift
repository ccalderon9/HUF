//
//  HomeView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    let campaigns: [String] = ["campaign2", "campaign3", "campaign1"]
    let topPickProducts: [Product] = MockDataService().categories[0].subcategories[4].products
    
    var body: some View {
        NavigationStack(path: $navigationRouter.path) {
            ScrollView {
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ZStack {
                            Rectangle()
                                .fill(Color.logoGreen)
                                .frame(width: 48, height: 48)
                            Text("HUF")
                                .foregroundColor(.white)
                                .font(.custom(Font.overpassBold, size: 17))
                                .kerning(3)
                        }
                        
                        Text("FREE US DELIVERY ON ORDERS $75+")
                            .font(.custom(Font.overpassBold, size: 17))
                            .frame(idealWidth: .infinity, maxWidth: .infinity, minHeight: 48)
                            .background(.black)
                            .foregroundColor(.white)
                    }
                    
                    ZStack {
                        TabView {
                            ForEach(campaigns, id: \.hashValue) { campaign in
                                ZStack {
                                    Image(campaign)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 500)
                                    
                                    VStack {
                                        Text("SUMMER 23")
                                            .font(.custom(Font.overpassBold, size: 30))
                                            .foregroundColor(.white)
                                        
                                        Text("AVAILABLE NOW")
                                            .font(.custom(Font.overpassRegular, size: 16))
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                        }
                        .tabViewStyle(.page(indexDisplayMode: .always))
                        
                        VStack {
                            Spacer()
                            
                            HStack {
                                Button {
                                    navigationRouter.navigateToSubcategory(0)
                                } label: {
                                    Text("SHOP")
                                        .font(.custom(Font.overpassBold, size: 20))
                                }
                                .foregroundColor(.white)
                                .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                                .background(Color.black)
                                .clipShape(Capsule())
                                .padding(.bottom, 60)
                                
                                Spacer()
                            }
                            .padding(.horizontal, 16)
                        }
                    }
                    .frame(height: 500)
                    .padding(.bottom, 40)
                    
                    HStack {
                        Text("Top Picks for You")
                            .font(.custom(Font.overpassRegular, size: 24))
                        Spacer()
                    }
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(topPickProducts, id: \.hashValue) { product in
                                Button {
                                    navigationRouter.navigateToProductDetail(product.id)
                                } label: {
                                    VStack(spacing: 0) {
                                        Image(product.images.first!)
                                            .resizable()
                                            .frame(width: 250, height: 250)
                                            .background(Color.grayBackground)
                                            .clipShape(RoundedRectangle(cornerRadius: 32))
                                            .padding(.bottom, 12)
                                        
                                        Text(product.name)
                                            .font(.custom(Font.overpassRegular, size: 16))
                                            .kerning(1)
                                            .foregroundColor(.black)
                                            .padding(.bottom, 8)
                                        
                                        Text(product.price)
                                            .font(.custom(Font.overpassRegular, size: 16))
                                            .kerning(1)
                                            .foregroundColor(.gray)
                                        
                                        Rectangle()
                                            .fill(.clear)
                                            .frame(height: 100)
                                    }
                                }
                            }
                            .padding(.leading, 16)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.bottom, 16)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        // present search
                    } label: {
                        Image(systemName: "person.fill")
                            .resizable()
                            .foregroundColor(Color.gray)
                            .frame(width: 26, height: 26)
                    }
                }
            }
            .navigationDestination(for: NavigationRouter.Route.self) { route in
                switch route {
                case .productDetail(let id):
                    ProductDetailView(productId: id)
                case .subcategory(let id):
                    SubcategoryView(subcategoryId: id)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 14 Pro Max")
            .environmentObject(NavigationRouter())
    }
}
