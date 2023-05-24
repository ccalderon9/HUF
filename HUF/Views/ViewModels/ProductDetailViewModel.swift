//
//  ProductDetailViewModel.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

import Combine
import Foundation

class ProductDetailViewModel: ObservableObject {
    
    @Injected(\.container) var container: BLContainer
    
    @Published var product: Product = MockDataService().categories[0].subcategories[4].products[0] //Product()
    
    @Published var selectedPhotoIndex: Int = 0
    @Published var selectedSize: String = "Select Size"
    @Published var selectedColor: String = "Dusty Rose"
    
    let disposableBag = DisposableBag()
    
    init(productId: Int) {
//        container.interactor.fetchProduct(id: productId)
//            .sink { completion in
//
//            } receiveValue: { product in
//                self.product = product
//            }
//            .store(in: disposableBag)
    }
    
    func addToCart() {
        // Add product + size
    }
}
