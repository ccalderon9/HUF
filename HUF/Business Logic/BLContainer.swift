//
//  BLContainer.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import SwiftUI

class BLContainer: ObservableObject {
    
    var interactor: Interactor
    
    init(_ interactor: Interactor) {
        self.interactor = interactor
    }
}
