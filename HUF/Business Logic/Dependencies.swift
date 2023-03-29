//
//  Dependencies.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

struct Dependencies: InjectionKey {
    static var currentValue: BLContainer = Dependencies.default

    static private var `default`: BLContainer = BLContainer(DefaultInteractor())
}

extension InjectionValues {
    var container: BLContainer {
        get { Self[Dependencies.self] }
        set { Self[Dependencies.self] = newValue }
    }
}
