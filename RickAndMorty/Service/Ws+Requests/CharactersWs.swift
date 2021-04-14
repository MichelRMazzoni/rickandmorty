//
//  Webservice+Router.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

enum RouterCharacters: RouterEnum {
    
    case getCharactersList
    
    var method: HTTPMethod {
        switch self {
        case .getCharactersList:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharactersList:
            return "/api/character/"
        }
    }
    
    var urlParams: [String : String]? {
        switch self {
        case .getCharactersList:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .getCharactersList:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCharactersList:
            return nil
        }
    }

}
