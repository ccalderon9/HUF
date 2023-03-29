//
//  Product.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Foundation

struct Category: Decodable, Equatable, Hashable, Identifiable {
    
    var id: Int = 0
    var name: String = ""
    var subcategories: [Subcategory] = []
}

struct Subcategory: Decodable, Equatable, Hashable, Identifiable {
    
    var id: Int = 0
    var name: String = ""
    var products: [Product] = []
}

struct Product: Decodable, Equatable, Hashable, Identifiable {
    
    var id: Int = 0
    var name: String = ""
    var price: String = ""
    var colors: [String] = []
    var images: [String] = []
    var sizes: [String] = []
    var blurb: String = ""
    var description: String = ""
}
