//
//  DefaultInteractor.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

import Combine
import SwiftUI

class DefaultInteractor: Interactor {

    init() {
        
    }
    
    func fetchProduct(id: Int) -> AnyPublisher<Product, NetworkingError> {
        return Just(Product()).setFailureType(to: NetworkingError.self).eraseToAnyPublisher()
    }
    
    func fetchSubcategory(id: Int) -> AnyPublisher<Subcategory, NetworkingError> {
        return Just(Subcategory()).setFailureType(to: NetworkingError.self).eraseToAnyPublisher()
    }
    
}

