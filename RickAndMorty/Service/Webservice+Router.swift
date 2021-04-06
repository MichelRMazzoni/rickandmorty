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
            return "/api/character/"
        case .getCharacterDetails:
            return "/api/character/"
        }
    }
    
    private var urlParams: [String: String]? {
        switch self {
        case .getCharactersList:
            return nil
        case .getCharacterDetails:
            return nil
        }
    }
    
    private var body: [String: Any]? {
        switch self {
        case .getCharactersList:
            return nil
        case .getCharacterDetails:
            return nil
        }
    }
    
    private var headers: [String: String]? {
        switch self {
        case .getCharactersList:
            return nil
        case .getCharacterDetails:
            return nil
        }
    }
    
    func makeUrlRequest() throws -> URLRequest {

        var components = URLComponents()
        components.scheme = urlScheme
        components.host = baseURLString
        components.path = path
        components.queryItems = urlParams?.map { URLQueryItem(name: $0.key, value: $0.value) }
        
        guard let url = components.url else {
            throw ErrorType.parseUrlFail
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue.uppercased()
        if body?.count ?? 0 > 0 {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body as Any)
        }
        if headers?.count ?? 0 > 0 {
            headers?.forEach({ (key, value) in
                request.addValue(value, forHTTPHeaderField: key)
            })
        }
        
        print("REQUEST = \(request)")

        return request
    }
}