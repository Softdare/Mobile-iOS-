//
//  LoginService.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 9.05.2022.
//

import Foundation


final class NetworkService {
    // TODO: Initalize the api connection data, or any client declaration
    
    // TODO: SignIn And SignUP Functions
    
    // SignIn
    static func signIn(credentials : SignInCredentials) -> Bool {
        if let email = credentials.email {
            return signIn(email: email, password: credentials.password)
        }
        return signIn(username: credentials.username!, password: credentials.password)
    }
    private static func signIn(email: String, password: String) -> Bool {
        if email == "me@com" && password == "me" {
            return true
        }
        return false
    }
    private static func signIn(username: String, password: String) -> Bool{
        if username == "me" && password == "me" {
            return true
        }
        return false
    }
    // SignUp
}
