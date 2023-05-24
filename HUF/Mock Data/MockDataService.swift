//
//  MockDataService.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import Foundation

class MockDataService {
    let queue = DispatchQueue(label: "mockDataService")
    
    var categories: [Category] {
        return [
            Category(
                id: 0,
                name: "CLOTHING",
                subcategories: [
                    Subcategory(
                        id: 0,
                        name: "T-SHIRTS",
                        image: "hats",
                        products: []),
                    Subcategory(
                        id: 1,
                        name: "HOODIES & FLEECES",
                        image: "jackets",
                        products: []),
                    Subcategory(
                        id: 2,
                        name: "TOPS",
                        image: "socks",
                        products: []),
                    Subcategory(
                        id: 3,
                        name: "BOTTOMS",
                        image: "bottoms",
                        products: []),
                    Subcategory(
                        id: 4,
                        name: "JACKETS",
                        image: "jackets",
                        products: [
                            Product(
                                id: 0,
                                name: "Corduroy Trucker Jacket",
                                price: "$125",
                                colors: ["dustyRose", "hufGreen", "navy"],
                                images: [
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE",
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE-back",
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE-detail",
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE-model-close-up",
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE-model",
                                    "CORDUROY-TRUCKER-JACKET_DUSTY-ROSE-model-female"
                                ],
                                sizes: ["X-Small", "Small", "Medium", "Large"],
                                blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                                description: """
                                • 100% cotton (8oz) 8 wale corduroy trucker jacket
                                • Full-zip front closure
                                • Left chest patch pocket with zip closure
                                • Dual front patch hand pockets
                                • HUF woven flag label at front left pocket
                                """),
                            Product(
                                id: 1,
                                name: "Landmark Jacket",
                                price: "$140",
                                colors: [],
                                images: [
                                    "LANDMARK-JACKET_DENIM",
                                    "LANDMARK-JACKET-back",
                                    "LANDMARK-JACKET-close-up-sleeve",
                                    "LANDMARK-JACKET-close-up",
                                    "LANDMARK-JACKET-female",
                                    "LANDMARK-JACKET-male"
                                ],
                                sizes: ["X-Small", "Small", "Medium", "Large"],
                                blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                                description:  """
                                • 85/15 cotton-poly (8oz) denim jacket \n
                                • All-over landmark-inspired print
                                • Embroidered artwork at left chest
                                • Dual front welt hand pockets
                                • Full-zip front closure
                                • 2x2 rib-knit at collar, cuffs, and hem
                                • HUF woven label at interior neck
                                """),
                            Product(
                                id: 2,
                                name: "HUF x Goodyear Touring Satin Jacket",
                                price: "$130",
                                colors: [],
                                images: [
                                    "TOURING-SATIN-JACKET_BLACK-front",
                                    "TOURING-SATIN-JACKET_BLACK-back"
                                ],
                                sizes: ["Small", "Medium", "Large", "X-Large", "XX-Large"],
                                blurb: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam.",
                                description:  """
                                • 95/5 poly-spandex satin touring jacket
                                • Embroidered artwork at chest and back
                                • Diamond quilt lined body with lightweight fill
                                • Snap-button front
                                • Front welt pockets
                                • 1x1 rib-knit at collar, cuffs, and hem
                                • HUF x Goodyear woven label at interior neck
                                """)]),
                    Subcategory(
                        id: 5,
                        name: "HATS",
                        image: "hats",
                        products: []),
                    Subcategory(
                        id: 6,
                        name: "SOCKS",
                        image: "socks",
                        products: []),
                    Subcategory(
                        id: 7,
                        name: "ALL CLOTHING",
                        image: "allclothing",
                        products: []),
                ]),
            Category(
                id: 1,
                name: "ACCESSORIES",
                subcategories: []),
            Category(
                id: 2,
                name: "COLLECTIONS",
                subcategories: []),
            Category(
                id: 3,
                name: "COLLABORATIONS",
                subcategories: [])
        ]
    }
}

extension MockDataService {
    
    private func decodeJSON<T: Decodable>(from fileName: String) throws -> T {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json") else {
            throw NetworkingError.authorizationFailure
        }
        
        do {
            let data = try Data(contentsOf: URL(filePath: path))
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch {
            if let decodingError = error as? DecodingError {
                switch decodingError {
                case .dataCorrupted(let context):
                    debugPrint("MockDataService JSON Parsing Error: Context = \(context)")
                case .keyNotFound(let key, let context):
                    debugPrint("MockDataService JSON Parsing Error: Context = \(context), key = \(key)")
                case .typeMismatch(let type, let context), .valueNotFound(let type, let context):
                    debugPrint("MockDataService JSON Parsing Error: Context = \(context), type = \(type)")
                default:
                    debugPrint("MockDataService Unknown decoding error")
                }
            }
            throw NetworkingError.authorizationFailure
        }
    }
    
    func publisher<T: Decodable>(for fileName: String) -> AnyPublisher<T, NetworkingError> {
        return Just(fileName)
            .receive(on: queue)
            .tryMap {
                try self.decodeJSON(from: $0) as T
            }
            .mapError { $0 as? NetworkingError ?? NetworkingError.authorizationFailure }
            .eraseToAnyPublisher()
    }
}

enum NetworkingError: Error {
    case authorizationFailure
}
