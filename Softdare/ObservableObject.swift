//
//  ObservableObject.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 9.05.2022.
//

import Foundation


final class ObservableObject<T> {
    typealias Listener = (T) -> Void
    var value : T {
        didSet {
            for listener in listeners {
                listener(value)
            }
            
        }
    }
    var listeners : [Listener] = []
    
    init(_ value : T) {
        self.value = value
    }
    
    func bind(_ listener: @escaping Listener) {
        listener(self.value)
        self.listeners.append(listener)
    }
}
