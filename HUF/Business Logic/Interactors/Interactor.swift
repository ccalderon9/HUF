//
//  Interactor.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import Foundation

protocol Interactor {
    func fetchProduct(id: Int) -> AnyPublisher<Product, NetworkingError>
    func fetchSubcategory(id: Int)-> AnyPublisher<Subcategory, NetworkingError>
}
