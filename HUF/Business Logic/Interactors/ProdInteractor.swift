//
//  ProdInteractor.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import SwiftUI

class ProdInteractor: Interactor {
    
    var webRepository: WebRepository
//    var dataRepository: any DataRepository
    
    init(webRepository: WebRepository) {
        self.webRepository = webRepository
    }
    
    func fetchProduct(id: Int) -> AnyPublisher<Product, NetworkingError> {
        return webRepository.getProduct(id: id)
    }
    
    func fetchSubcategory(id: Int)-> AnyPublisher<Subcategory, NetworkingError> {
        return webRepository.getSubcategory(id: id)
    }
}
