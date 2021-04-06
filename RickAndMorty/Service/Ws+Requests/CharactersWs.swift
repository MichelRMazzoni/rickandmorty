//
//  Webservice+Router.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

enum RouterCharacters: RouterEnum {
    
    case getCharactersList
    case getCharacterDetails(id: Int)
    
    var method: HTTPMethod {
        switch self {
        case .getCharactersList:
            return .get
        case .getCharacterDetails(_):
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharactersList:
            return "/api/character/"
        case .getCharacterDetails(let id):
            return "/api/character/\(id)"
        }
    }
    
    var urlParams: [String : String]? {
        switch self {
        case .getCharacterDetails(_):
            return nil
        case .getCharactersList:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .getCharacterDetails(_):
            return nil
        case .getCharactersList:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCharacterDetails(_):
            return nil
        case .getCharactersList:
            return nil
        }
    }

}
