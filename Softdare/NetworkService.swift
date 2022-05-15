//
//  NetworkService.swift
//  Softdare
//
//  Created by Nazif Enes Kızılcin on 13.05.2022.
//

import Foundation

enum HTTPMethods: String {
    case get, head, post, put, delete, connect, options, trace, patch
}

extension URLSession {
    enum CustomError: Error {
        case invalidUrl
        case invalidData
    }
    func get<T: Codable>(url: URL?, expecting: T.Type, completion: @escaping (Result<T,Error>) -> Void ) {
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        let task = dataTask(with: url) { data, _, error in
            guard data != nil else {
                if let error = error {
                    completion(.failure(error))
                }else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data!)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    func post<T: Codable,E>(url: URL?,data: E, expecting: T.Type, completion: @escaping (Result<T,Error>) -> Void ) {
        guard let url = url else {
            completion(.failure(CustomError.invalidUrl))
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethods.get.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONSerialization.data(withJSONObject: data, options: .fragmentsAllowed)
        
        let task = dataTask(with: url) { data, _, error in
            guard data != nil else {
                if let error = error {
                    completion(.failure(error))
                }else {
                    completion(.failure(CustomError.invalidData))
                }
                return
            }
            do {
                let result = try JSONDecoder().decode(expecting, from: data!)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
