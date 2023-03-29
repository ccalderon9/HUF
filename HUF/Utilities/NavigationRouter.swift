//
//  NavigationRouter.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    
    enum Route: Hashable {
        case productDetail(Int)
        case subcategory(Int)
    }
    
    @Published var path: NavigationPath = NavigationPath()
    
    func navigateToProductDetail(_ id: Int) {
        path.append(Route.productDetail(id))
    }
    
    func navigateToSubcategory(_ id: Int) {
        path.append(Route.subcategory(id))
    }
    
}
