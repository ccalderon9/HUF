//
//  Storable.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/23/23.
//

import Foundation

//protocol Storable: Identifiable, Equatable {
//    mutating func update(_ value: Self)
//}
//
//protocol StorableList: Equatable {
//    associatedtype S: Storable
//    
//    var values: [S] { get }
//    var isEmpty: Bool { get }
//    
//    func get(id: S.ID) -> S?
//    func get(ids: [S.ID]) -> [S]
//    func getAll() -> [S]
//    mutating func store(value: S)
//    mutating func store(values: [S], override: Bool)
//    mutating func update(id: S.ID, _ update: (inout S) -> Void)
//    mutating func remove(id: S.ID)
//    mutating func remove(ids: [S.ID])
//    mutating func removeAll()
//    subscript(id: S.ID) -> S? { get set }
//}
//
//protocol StorableContainer: Equatable {
//    associatedtype R: StorableList where R.S == Region
//    var regions: R { get set }
//    associatedtype O: StorableList where O.S == Office
//    var offices: O { get set }
//    associatedtype Q: StorableList where Q.S == QuestionnaireCategory
//    var questionnaireCategories: Q { get set }
//    associatedtype SO: StorableList where SO.S == ServiceOrder
//    var serviceOrders: SO { get set }
//}
//
