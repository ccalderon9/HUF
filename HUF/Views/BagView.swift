//
//  BagView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/24/23.
//

import SwiftUI

struct BagView: View {
    
    var viewModel: CartViewModel = CartViewModel()
    
    var body: some View {
        VStack(spacing: 0) {
            ForEach(viewModel.products) { product in
                ProductView(product: product)
            }
            
            Text("SUBTOTAL $706.00")
                .fontWeight(.bold)
                .fontWidth(.condensed)
                .padding(.vertical, 24)
            
            HStack(spacing: 4) {
                Image(systemName: viewModel.isAgreed ? "checkmark.square" : "square")
                    .foregroundColor(.black)
                    .onTapGesture {
                        withAnimation {
                            viewModel.isAgreed.toggle()
                        }
                    }
                
                Text("I AGREE TO THE TERMS AND CONDITIONS")
                    .fontWeight(.bold)
                    .fontWidth(.condensed)
            }
            .padding(.bottom, 16)
            
            Button {
                viewModel.checkout()
            } label: {
                Text("CHECKOUT")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.title)
                    .fontWidth(.condensed)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .border(.black, width: 2)
            }
            .padding(.bottom, 16)
            
            Text("LIMITED TO 1 PER SIZE / ITEM")
                .fontWeight(.bold)
                .fontWidth(.condensed)
                .foregroundColor(.gray)
            
            Text("*SOME EXCEPTIONS APPLY")
                .fontWeight(.bold)
                .fontWidth(.condensed)
                .foregroundColor(.gray)
            
            Spacer()
        }
    }
    
    struct ProductView: View {
        
        var product: Product
        
        var body: some View {
            VStack(spacing: 16) {
                HStack(spacing: 0) {
                    Image(product.images.first!)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    VStack(spacing: 4) {
                        HStack {
                            Text(product.name)
                                .fontWeight(.bold)
                                .fontWidth(.condensed)
                            Spacer()
                        }
                        
                        HStack {
                            Text("Small")
                                .font(.caption)
                            Spacer()
                        }
                        
                        HStack {
                            Text(product.price)
                                .font(.caption)
                                .padding(.bottom, 4)
                            Spacer()
                        }
                        
                        HStack {
                            Button {
                                // Add to cart
                            } label: {
                                Text("REMOVE")
                                    .font(.caption)
                                    .fontWeight(.bold)
                                    .fontWidth(.condensed)
                                    .foregroundColor(.white)
                                    .frame(width: 60, height: 22)
                                    .background(Color.black)
                            }
                            Spacer()
                        }
                    }
                }
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 2)
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        BagView()
    }
}
