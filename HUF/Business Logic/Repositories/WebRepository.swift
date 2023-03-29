//
//  WebRepository.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import Foundation

protocol WebRepository {
    
    func getProduct(id: Int) -> AnyPublisher<Product, NetworkingError>
    func getSubcategory(id: Int)-> AnyPublisher<Subcategory, NetworkingError>
}

//struct ProdWebRepository: WebRepository {
//
//}

struct MockWebRepository: WebRepository {
    let mockDataService = MockDataService()
    
    func getProduct(id: Int) -> AnyPublisher<Product, NetworkingError> {
        return mockDataService.publisher(for: "Product")
            .delay(for: .seconds(2), scheduler: RunLoop.main, options: .none)
            .eraseToAnyPublisher()
    }
    
    func getSubcategory(id: Int)-> AnyPublisher<Subcategory, NetworkingError> {
        return mockDataService.publisher(for: "Subcategory")
            .delay(for: .seconds(2), scheduler: RunLoop.main, options: .none)
            .eraseToAnyPublisher()
    }
    
}
