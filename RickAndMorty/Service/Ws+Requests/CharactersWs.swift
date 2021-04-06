//
//  Webservice+Router.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

enum RouterCharacters: RouterEnum {
    
    case getCharactersList
    case getCharacterDetails
    
    var method: HTTPMethod {
        switch self {
        case .getCharactersList:
            return .get
        case .getCharacterDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getCharactersList:
            return "/api/character/"
        case .getCharacterDetails:
            return "/api/character/"
        }
    }
    
    var urlParams: [String : String]? {
        switch self {
        case .getCharacterDetails:
            return nil
        case .getCharactersList:
            return nil
        }
    }
    
    var body: [String : Any]? {
        switch self {
        case .getCharacterDetails:
            return nil
        case .getCharactersList:
            return nil
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .getCharacterDetails:
            return nil
        case .getCharactersList:
            return nil
        }
    }

}
