//
//  Operations.swift
//
//
//  Created by Clarissa Calderon on 5/20/23.
//

import UIKit

class AsynchronousOperation: Operation {
    
    // @objc property wrapper allows us to send KVO notifications
    
    @objc private enum OperationState: Int {
        case ready, executing, finished
    }
    
    @objc private var state: OperationState = .ready
    
    // At a minimum, you must override these properties and methods
    
    override var isExecuting: Bool {
        state == .executing
    }
    
    override var isFinished: Bool {
        state == .finished
    }
    
    override var isAsynchronous: Bool {
        true
    }
    
    override func start() {
        if isCancelled {
            state = .finished
            return
        }
        
        state = .executing
        
        main()
    }
    
    //
    
    override func main() {
        print("Executing task")
    }
    
    // Only finished operations can be removed from an operation queue
    
    override func waitUntilFinished() {
        if !isFinished { state = .finished }
    }
}








protocol Coordinator {
    
    var navigationController: UINavigationController? { get set }
    
    func eventOccurred(type: Event)
    
    func start()
}


enum Event {
    case buttonTapped
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}


class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    
    func eventOccurred(type: Event) {
        
    }
    
    func start() {
        
    }
    
}
