//
//  LoginService.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 9.05.2022.
//

import Foundation


final class LoginService {
    // TODO: Initalize the api connection data, or any client declaration
    static let url = URL(string: "backend-url")
    // TODO: SignIn And SignUP Functions
    
    // SignIn
    static func signIn(credentials : SignInCredentials) -> Bool {
        var response = SignInResponse()
        URLSession.shared.get(url: url, expecting: SignInResponse.self){ result in
            switch result {
            case .success(let signInResponse):
                response.success =  signInResponse.success
            case .failure(let error):
                response.error = error.localizedDescription
            }
        }
        return response.success
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
