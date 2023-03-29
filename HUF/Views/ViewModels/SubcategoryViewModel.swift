//
//  SubcategoryViewModel.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/27/23.
//

import Foundation

class SubcategoryViewModel: ObservableObject {
    
    @Injected(\.container) var container: BLContainer
    
    @Published var subcategoryId: Int = 0
    @Published var subcategory: Subcategory = Subcategory()
    
    let disposableBag = DisposableBag()
    
    init(subcategoryId: Int) {
        self.subcategoryId = subcategoryId

        container.interactor.fetchSubcategory(id: subcategoryId)
            .sink { _ in
                
            } receiveValue: { subcategory in
                self.subcategory = subcategory
            }
            .store(in: disposableBag)


    }
    
}
