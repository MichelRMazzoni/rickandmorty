//
//  Webservice+Router.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

enum Router {
    case getCharactersList
    case getCharacterDetails
    
    private enum HTTPMethod: String {
        case get
        case post
        case put
        case delete
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getCharactersList:
            return .get
        case .getCharacterDetails:
            return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getCharactersList:
            return "/api/character"
        case .getCharacterDetails:
            return "/api/character"
        }
    }
    
    private var urlParams: [String: String] {
        switch self {
        case .getCharactersList:
            return [:]
        case .getCharacterDetails:
            return [:]
        }
    }
    
    private var body: [String: Any] {
        switch self {
        case .getCharactersList:
            return [:]
        case .getCharacterDetails:
            return [:]
        }
    }
    
    private var headers: [String: String] {
        switch self {
        case .getCharactersList:
            return [:]
        case .getCharacterDetails:
            return [:]
        }
    }
    
    func request() throws -> URLRequest {

        var components = URLComponents()
        components.scheme = "https"
        components.host = baseURLString
        components.path = path
        components.queryItems = urlParams.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components.url else {
            throw ErrorType.parseUrlFail
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        
        
        print("REQUEST = \(request)")
        
        switch self {
        case .getCharactersList:
            return request
            
        case .getCharacterDetails:
            return request
        }
    }
}
