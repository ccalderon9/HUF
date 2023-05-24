//
//  ShopView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct ShopView: View {
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    @State private var searchText = ""
    
    @StateObject var viewModel: ShopFlowViewModel = ShopFlowViewModel()
    
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
                                    .font(.custom(Font.overpassBold, size: 20))
                                    .kerning(-1)
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
                        let subcategories =  viewModel.categories.first(where: { $0.id == viewModel.selectedCategoryId })?.subcategories
                        
                        ForEach(subcategories ?? [], id: \.id) { subcategory in
                            Button {
                                navigationRouter.navigateToSubcategory(subcategory.id)
                            } label: {
                                ZStack {
                                    Image("\(subcategory.image)")
                                        .resizable()
                                        .frame(width: calculateDimensions(), height: calculateDimensions())
                                        .saturation(0.0)
                                    
                                    Rectangle()
                                        .fill(Color.logoGreen.opacity(0.5))
                                        .frame(width: calculateDimensions() - 80, height: calculateDimensions() - 80)
                                    
                                    Text(subcategory.name)
                                        .font(.custom(Font.overpassBold, size: 28))
                                        .kerning(-1)
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
        .searchable(text: $searchText)
    }
    
    private func calculateDimensions() -> CGFloat {
        let remainingHorizontalSpace = UIScreen.main.bounds.width - 4
        return remainingHorizontalSpace / 2
    }
}

struct ShopView_Previews: PreviewProvider {
    static var previews: some View {
        ShopView().environmentObject(NavigationRouter())
    }
}
