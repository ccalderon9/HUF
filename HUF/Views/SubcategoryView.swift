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
                                Image(product.images.first!)
                                    .resizable()
                                    .frame(width: calculateDimensions(), height: calculateDimensions())
                                    .background(Color.grayBackground)
                                    .clipShape(RoundedRectangle(cornerRadius: 32))
                                    .padding(.bottom, 16)
                                
                                if !product.colors.isEmpty {
                                    HStack {
                                        ForEach(product.colors, id: \.hashValue) { color in
                                            Rectangle()
                                                .fill(Color(color))
                                                .frame(width: 16, height: 16)
                                        }
                                    }
                                    .padding(.bottom, 12)
                                }
                                
                                Text(product.name)
                                    .font(.custom(Font.overpassLight, size: 16))
                                    .kerning(1)
                                    .foregroundColor(.black)
                                    .frame(width: calculateDimensions())
                                    .padding(.bottom, 8)
                                
                                Text(product.price)
                                    .font(.custom(Font.overpassRegular, size: 16))
                                    .kerning(1)
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
