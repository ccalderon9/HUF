//
//  ProductListView.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject var navigationRouter: NavigationRouter = NavigationRouter()
    @StateObject var viewModel: ShopFlowViewModel = ShopFlowViewModel()
    
    var body: some View {
        Text("hello")
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        return ProductListView()
    }
}
