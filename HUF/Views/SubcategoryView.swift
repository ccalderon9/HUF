//
//  SubcategoryView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import SwiftUI

struct SubcategoryView: View {
    
    @StateObject var viewModel: SubcategoryViewModel
    
    @EnvironmentObject var navigationRouter: NavigationRouter
    
    var subcategory: Subcategory = MockDataService().categories[0].subcategories[4]
    
    let columns = [
        GridItem(.flexible(), spacing: 4),
        GridItem(.flexible(), spacing: 4),
     ]
    
    init(subcategoryId: Int) {
        _viewModel = StateObject(wrappedValue: SubcategoryViewModel(subcategoryId: subcategoryId))
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 32) {
                    ForEach(subcategory.products) { product in
                        Button {
                            navigationRouter.navigateToProductDetail(product.id)
                        } label: {
                            VStack(spacing: 0) {
                                Rectangle()
                                    .fill(.green)
                                    .frame(width: calculateDimensions(), height: calculateDimensions())
                                    .padding(.bottom, 16)
                                
                                if !product.colors.isEmpty {
                                    HStack {
                                        ForEach(product.colors, id: \.hashValue) { color in
                                            Rectangle()
                                                .fill(.green)
                                                .frame(width: 16, height: 16)
                                        }
                                    }
                                    .padding(.bottom, 12)
                                }
                                
                                Text(product.name)
                                    .font(.callout)
                                    .foregroundColor(.black)
                                    .frame(width: calculateDimensions())
                                
                                Text(product.price)
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                
                                Spacer()
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text(subcategory.name))
        .padding(.vertical, 16)
    }
    
    private func calculateDimensions() -> CGFloat {
        let remainingHorizontalSpace = UIScreen.main.bounds.width - 32 - (16 * 2)

        return remainingHorizontalSpace / 2
    }
}

struct SubcategoryView_Previews: PreviewProvider {
    static var previews: some View {
        SubcategoryView(subcategoryId: 0)
    }
}
