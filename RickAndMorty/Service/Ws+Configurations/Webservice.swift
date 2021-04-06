//
//  Webservice.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

enum Result<T> {
    case success(data: T)
    case failure(error: Error)
}

enum ErrorType: LocalizedError {
    case parseUrlFail
    case notFound
    case validationError
    case serverError
    case defaultError
    
    var errorDescription: String? {
        switch self {
        case .parseUrlFail:
            return "Cannot initial URL object."
        case .notFound:
            return "Not Found"
        case .validationError:
            return "Validation Errors"
        case .serverError:
            return "Internal Server Error"
        case .defaultError:
            return "Something went wrong."
        }
    }
}

class Webservice {
    static let shared = Webservice()
    
    private let config: URLSessionConfiguration
    private let session: URLSession
    
    private init() {
        config = URLSessionConfiguration.default
        session = URLSession(configuration: config)
    }
    
    func request<T: Decodable>(router: RouterEnum, completion: @escaping (Result<T>) -> ()) {
        do {
            let task = try session.dataTask(with: router.makeUrlRequest()) { (data, urlResponse, error) in
                DispatchQueue.main.async {
                    if let error = error {
                        completion(Result<T>.failure(error: error))
                        return
                    }
                    
                    guard let statusCode = urlResponse?.getStatusCode(), (200...299).contains(statusCode) else {
                        let errorType: ErrorType
                        
                        switch urlResponse?.getStatusCode() {
                        case 404:
                            errorType = .notFound
                        case 422:
                            errorType = .validationError
                        case 500:
                            errorType = .serverError
                        default:
                            errorType = .defaultError
                        }
                        
                        completion(Result<T>.failure(error: errorType))
                        return
                    }
                    
                    guard let data = data else {
                        completion(Result<T>.failure(error: ErrorType.defaultError))
                        return
                    }
                    
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        print(result)
                        completion(Result.success(data: result))
                    } catch let error {
                        completion(Result.failure(error: error))
                    }
                }
            }
            task.resume()
            
        } catch let error {
            completion(Result<T>.failure(error: error))
        }
    }
}

extension URLResponse {
    func getStatusCode() -> Int? {
        if let httpResponse = self as? HTTPURLResponse {
            return httpResponse.statusCode
        }
        return nil
    }
}
