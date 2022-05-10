//
//  SignInViewModel.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 9.05.2022.
//

import Foundation

class SignInViewModel {
    
    private var success : ObservableObject<Bool> = ObservableObject(false)
    
    // The method bind provides the abstraction between model and view.
    typealias Listener = (Bool) -> Void
    func bind(_ listener: @escaping Listener) {
        self.success.bind(listener)
    }
}
