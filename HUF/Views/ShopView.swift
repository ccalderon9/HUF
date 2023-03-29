//
//  ShopView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct ShopView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    @StateObject var viewModel: ShopFlowViewModel = ShopFlowViewModel()
    
    let subcategories: [String] = ["T-Shirts", "Hoodies & Fleece", "Tops", "Bottoms", "Jackets", "Hats", "Socks", "All Clothing"]
    
    let colors: [Color] = [Color.green, Color.brown, Color.yellow, Color.orange, Color.red, Color.blue, Color.purple, Color.pink, Color.teal, Color.mint, Color.indigo, Color.gray]
    
    let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
     ]
    
    var body: some View {
        NavigationStack(path: $navigationRouter.path) {
            VStack(spacing: 0) {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(viewModel.categories) { category in
                            Button {
                                viewModel.selectedCategoryId = category.id
                            } label: {
                                Text(category.name)
                                    .foregroundColor(.black)
                                    .fontWeight(category.id == viewModel.selectedCategoryId ? .bold : .regular)
                                    .underline(category.id == viewModel.selectedCategoryId) // not an underline but a segmented control
                                    .padding(.trailing, 20)
                                    .padding(.vertical, 8)
                            }
                        }
                    }
                    .padding(.leading, 16)
                }
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 4) {
                        let colorsAndSubcategory = zip(colors, viewModel.categories.first(where: { $0.id == viewModel.selectedCategoryId })?.subcategories ?? []).map { ($0, $1) }
                        ForEach(colorsAndSubcategory, id: \.0.description) { colorsAndSubcategory in
                            Button {
                                navigationRouter.navigateToSubcategory(colorsAndSubcategory.1.id)
                            } label: {
                                ZStack {
                                    Rectangle()
                                        .fill(colorsAndSubcategory.0)
                                        .frame(width: calculateDimensions(), height: calculateDimensions())
                                    
                                    Text(colorsAndSubcategory.1.name)
                                        .font(.title)
                                        .foregroundColor(.white)
                                }
                            }
                        }
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
    
    private func calculateDimensions() -> CGFloat {
        let remainingHorizontalSpace = UIScreen.main.bounds.width - 4
        return remainingHorizontalSpace / 2
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView()
    }
}
