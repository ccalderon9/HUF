//
//  CartViewModel.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/24/23.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Injected(\.container) var container: BLContainer
    
    @Published var products: [Product] = []
    @Published var selectedProductId: Int? = nil
    @Published var isAgreed: Bool = false
    @Published var isPresentingTooltip: Bool = false
    
    let disposableBag = DisposableBag()
    
    init() {
       

    }
    
    func checkout() {
        guard isAgreed else { isPresentingTooltip = true; return }
        
        
    }
}
