//
//  HUFApp.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import SwiftUI

@main
struct HUFApp: App {
    
    var body: some Scene {
        let container = BLContainer(ProdInteractor(webRepository: MockWebRepository()))
        
        WindowGroup {
            TabsView()
                .injection(\.container, container)
        }
    }
}
