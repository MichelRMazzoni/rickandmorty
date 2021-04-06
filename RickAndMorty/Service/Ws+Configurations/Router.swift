//
//  Router.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 06/04/21.
//

import Foundation

protocol RouterEnum {
    var method: HTTPMethod { get }
    var path: String { get }
    var urlParams: [String: String]? { get }
    var body: [String: Any]? { get }
    var headers: [String: String]? { get }
    
}

extension RouterEnum {
    
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
