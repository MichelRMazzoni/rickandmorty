//
//  Characters.swift
//  RickAndMorty
//
//  Created by Mazzoni, Michel Rodrigo on 05/04/21.
//

import Foundation

struct CharactersResponse: Codable {
    var results: [CharactersResult]?
}

struct CharactersResult: Codable {
    var id: Int?
    var gender: String?
    var url: String?
}

struct CharactersDetailsResult: Codable {
    var id: Int?
    var name: String?
    var status: String?
    var species: String?
    var type: String?
    var gender: String?
    var image: String?
}
