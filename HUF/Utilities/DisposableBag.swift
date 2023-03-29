//
//  DisposableBag.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import Combine
import Foundation

final class DisposableBag {
    var id: UUID = UUID()
    var subscriptions = Set<AnyCancellable>()
    let semaphore = DispatchSemaphore(value: 1)

    func cancel() {
        semaphore.wait()
        subscriptions.forEach { $0.cancel() }
        subscriptions.removeAll()
        semaphore.signal()
    }
}

extension AnyCancellable {
    func store(in disposableBag: DisposableBag) {
        disposableBag.semaphore.wait()
        disposableBag.subscriptions.insert(self)
        disposableBag.semaphore.signal()
    }
}
