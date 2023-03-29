//
//  ProductDetailView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

import SwiftUI

struct ProductDetailView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    @StateObject var viewModel: ProductDetailViewModel
    
    let colors: [Color] = [Color.green, Color.brown, Color.yellow]
    
    let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
     ]
    
    init(productId: Int) {
        _viewModel = StateObject(wrappedValue: ProductDetailViewModel(productId: productId))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                TabView {
                    ForEach(colors, id: \.hashValue) { color in
                        Rectangle()
                            .foregroundColor(color)
                            .frame(height: 390)
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .frame(height: 390)
                .padding(.top, 16)
                .padding(.bottom, 24)
                
                Group {
                    HStack {
                        Text(viewModel.product.name)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding(.bottom, 8)
                        
                        Spacer()
                        
                        VStack {
                            HStack(spacing: 12) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .frame(width: 21, height: 26)
                                    .foregroundColor(.black)
                                
                                Image(systemName: "heart")
                                    .resizable()
                                    .frame(width: 23, height: 22)
                                    .foregroundColor(.black)
                            }
                            
                            Spacer()
                        }
                    }
                    
                    HStack {
                        Text(viewModel.product.price)
                            .font(.callout)
                        Spacer()
                    }
                    .padding(.bottom, 24)
                    
                    if !viewModel.product.colors.isEmpty {
                        HStack {
                            ForEach(viewModel.product.colors, id: \.hashValue) { color in
                                Rectangle()
                                    .fill(.green)
                                    .frame(width: 64, height: 64)
                            }
                            
                            Spacer()
                        }
                        .padding(.bottom, 24)
                        
                        HStack {
                            Text("\(Text("Color:").fontWeight(.bold)) \(viewModel.selectedColor)")
                                .font(.callout)
                                .padding(.bottom, 20)
                            Spacer()
                        }
                    }
                    
                    Text(viewModel.product.blurb)
                        .lineLimit(nil)
                        .padding(.bottom, 56)
                    
                    Button {
                        
                    } label: {
                        Text("Select Size")
                    }
                    .buttonStyle(SecondaryButtonStyle())
                    .frame(width: 264)
                    .padding(.bottom, 16)
                    
                    Button {
                        
                    } label: {
                        Text("Add to Bag")
                    }
                    .buttonStyle(PrimaryButtonStyle())
                    .frame(width: 264)
                    .padding(.bottom, 56)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                    
                    DisclosureGroup("Product Details") {
                        Text(viewModel.product.description)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 20)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                }
                .padding(.horizontal, 16)
                
                Group {
                    DisclosureGroup("Shipping Details") {
                        Text(viewModel.product.description)
                            .font(.body)
                            .foregroundColor(.black)
                    }
                    .padding(.vertical, 20)
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(height: 1)
                        .padding(.bottom, 48)
                    
                    HStack {
                        Text("Customers Also Viewed")
                            .font(.title3)
                            .textCase(.uppercase)
                        Spacer()
                    }
                    .padding(.bottom, 32)
                    
                    ScrollView(.horizontal, showsIndicators: true) {
                        HStack(spacing: 16) {
                            ForEach(colors, id: \.hashValue) { color in
                                RoundedRectangle(cornerRadius: 16)
                                    .foregroundColor(color)
                                    .frame(width: 250, height: 250)
                            }
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

struct ProductDetail_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(productId: 0)
    }
}
