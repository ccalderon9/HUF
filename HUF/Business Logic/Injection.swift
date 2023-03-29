//
//  Injection.swift
//  HUF
//
//  Created by Clarissa Calderon on 3/22/23.
//

import SwiftUI

public protocol InjectionKey {
    associatedtype Value
    
    static var currentValue: Self.Value { get set }
}

public struct InjectionValues {
    private static var shared = InjectionValues()
    
    public static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    @usableFromInline static subscript<T>(_ keyPath: WritableKeyPath<InjectionValues, T>) -> T {
        get { shared[keyPath: keyPath] }
        set { shared[keyPath: keyPath] = newValue }
    }
}

@propertyWrapper
struct Injected<T>: DynamicProperty {
    private let keyPath: WritableKeyPath<InjectionValues, T>
    var wrappedValue: T {
        get { InjectionValues[keyPath] }
        nonmutating set { InjectionValues[keyPath] = newValue }
    }
    
    var projectedValue: Binding<T> {
        get {
            Binding<T> (
                get: {
                    wrappedValue
                },
                set: { v in
                    wrappedValue = v
                }
            )
        }
    }
    
    init(_ keyPath: WritableKeyPath<InjectionValues, T>) {
        self.keyPath = keyPath
    }
}

extension View {
    @inlinable public func injection<V>(_ keyPath: WritableKeyPath<InjectionValues, V>, _ value: V) -> some View {
        InjectionValues[keyPath] = value
        
        return self
    }
}
