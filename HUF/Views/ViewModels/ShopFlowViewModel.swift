//
//  ShopFlowViewModel.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import UIKit

class ShopFlowViewModel: ObservableObject {
    
    @Injected(\.container) var container: BLContainer
    
    @Published var categories: [Category] = MockDataService().categories
    @Published var selectedCategoryId: Int = 0
    
//    @Published var selectedProductId: Int? = nil
    
    let disposableBag = DisposableBag()
    
    init() {


    }
}
